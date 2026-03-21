package com.ipem.api.modules.veiculo.service;

import com.ipem.api.modules.veiculo.model.Carro;
import com.ipem.api.modules.veiculo.repository.CarroRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class VeiculoService {

    private final CarroRepository carroRepository;

    public List<Carro> listarTodos() {
        return carroRepository.findAll();
    }

    public Carro salvar(Carro carro) {
        return carroRepository.save(carro);
    }

    public void deletar(String prefixo) {
        carroRepository.deleteById(prefixo);
    }
}
