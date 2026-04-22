package com.ipem.api.modules.veiculo.service;

import com.ipem.api.modules.veiculo.model.Carro;
import com.ipem.api.modules.veiculo.model.TipoCarro;
import com.ipem.api.modules.veiculo.repository.CarroRepository;
import com.ipem.api.modules.veiculo.repository.TipoCarroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VeiculoService {

    @Autowired
    private CarroRepository carroRepository;

    @Autowired
    private TipoCarroRepository tipoCarroRepository;

    @Transactional
    public void atualizarKmEObs(String prefixo, Float km, String obs) {
        Carro carro = carroRepository.findById(prefixo)
                .orElseThrow(() -> new RuntimeException("Veículo não encontrado com o prefixo: " + prefixo));

        carro.setKmAtual(km);
        carro.setObservacoes(obs);
        carroRepository.save(carro);
    }

    @Transactional
    public Carro salvar(Carro carro) {

        if (carro.getTipo() != null && carro.getTipo().getId() != null) {


            TipoCarro tipoGerenciado = tipoCarroRepository.findById(carro.getTipo().getId())
                    .orElseThrow(() -> new RuntimeException("Tipo de Carro não encontrado no banco de dados!"));

            carro.setTipo(tipoGerenciado);
        } else {
            throw new RuntimeException("O ID do Tipo de Veículo é obrigatório!");
        }

        return carroRepository.save(carro);
    }
}