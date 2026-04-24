package com.ipem.api.modules.servico.service;

import com.ipem.api.modules.servico.model.Servico;
import com.ipem.api.modules.servico.repository.ServicoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ServicoService {

    private final ServicoRepository servicoRepository;

    public List<Servico> listarTodos() {
        return servicoRepository.findAll();
    }

    public Optional<Servico> buscarPorId(Long id) {
        return servicoRepository.findById(id);
    }

    public Servico salvar(Servico servico) {
        return servicoRepository.save(servico);
    }

    public void deletar(Long id) {
        servicoRepository.deleteById(id);
    }
}
