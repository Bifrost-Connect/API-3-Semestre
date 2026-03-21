package com.ipem.api.modules.servico.service;

import com.ipem.api.modules.servico.model.Abastecimento;
import com.ipem.api.modules.servico.model.Servico;
import com.ipem.api.modules.servico.repository.AbastecimentoRepository;
import com.ipem.api.modules.servico.repository.ServicoRepository;
import com.ipem.api.modules.veiculo.repository.CarroRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ServicoService {

    private final ServicoRepository servicoRepository;
    private final AbastecimentoRepository abastecimentoRepository;
    private final CarroRepository carroRepository;

    // --- MÉTODOS DE CRUD ---

    public List<Servico> listarTodos() {
        return servicoRepository.findAll();
    }

    public Optional<Servico> buscarPorId(Long id) {
        return servicoRepository.findById(id);
    }

    @Transactional
    public Servico salvar(Servico servico) {
        // Lógica extra: Ao iniciar um serviço, poderíamos marcar o carro como indisponível
        if (servico.getId() == null) {
            servico.getCarro().setDisponivel(false);
            carroRepository.save(servico.getCarro());
        }
        return servicoRepository.save(servico);
    }

    @Transactional
    public void deletar(Long id) {
        servicoRepository.deleteById(id);
    }

    // --- LÓGICA DE CONSUMO ---

    /**
     * Calcula a média de consumo (KM/L) baseada no abastecimento atual
     * em relação ao último registro de abastecimento do mesmo veículo.
     */
    public Double calcularConsumo(Abastecimento atual) {
        // Verifica se as associações existem para evitar NullPointerException
        if (atual.getServico() == null || atual.getServico().getCarro() == null) {
            return 0.0;
        }

        String prefixo = atual.getServico().getCarro().getPrefixo();

        // Busca o último abastecimento do mesmo carro (exceto o atual) para comparar o KM
        Optional<Abastecimento> ultimoOpt = abastecimentoRepository
                .findFirstByServicoCarroPrefixoAndIdNotOrderByDataCriacaoDesc(prefixo, atual.getId());

        if (ultimoOpt.isPresent()) {
            Float kmAnterior = ultimoOpt.get().getKmRegistro();
            Float kmAtual = atual.getKmRegistro();
            Float kmPercorrida = kmAtual - kmAnterior;

            if (kmPercorrida > 0 && atual.getLitros() > 0) {
                return (double) (kmPercorrida / atual.getLitros());
            }
        }

        return 0.0;
    }

    /**
     * Método para finalizar um serviço, atualizando o KM do carro e sua disponibilidade
     */
    @Transactional
    public Servico finalizarServico(Long id, Float kmChegada) {
        return servicoRepository.findById(id).map(servico -> {
            servico.setKmChegada(kmChegada);
            servico.setDataChegada(new java.util.Date().toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDateTime());

            // Atualiza o carro
            var carro = servico.getCarro();
            carro.setKmAtual(kmChegada);
            carro.setDisponivel(true);
            carroRepository.save(carro);

            return servicoRepository.save(servico);
        }).orElseThrow(() -> new RuntimeException("Serviço não encontrado"));
    }
}