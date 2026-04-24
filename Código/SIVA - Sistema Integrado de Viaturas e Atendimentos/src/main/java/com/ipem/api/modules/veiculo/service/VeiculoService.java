package com.ipem.api.modules.veiculo.service;

import com.ipem.api.modules.veiculo.model.Carro;
import com.ipem.api.modules.veiculo.repository.CarroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VeiculoService {

    @Autowired
    private CarroRepository carroRepository; // Ajustado para o nome real do seu arquivo

    @Transactional
    public void atualizarKmEObs(String prefixo, Float km, String obs) {
        // Busca o Carro pelo prefixo (ID) usando o seu CarroRepository
        Carro carro = carroRepository.findById(prefixo)
                .orElseThrow(() -> new RuntimeException("Veículo não encontrado com o prefixo: " + prefixo));

        // Atualiza os campos conforme sua classe Carro
        carro.setKmAtual(km);
        carro.setObservacoes(obs);

        // Salva as alterações no MySQL
        carroRepository.save(carro);
    }

    public Carro salvar(Carro carro) {
        return carroRepository.save(carro);
    }
}