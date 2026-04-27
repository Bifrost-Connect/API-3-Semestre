package com.ipem.api.modules.service.repository;

import com.ipem.api.modules.service.model.Record;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface RecordRepository extends JpaRepository<Record, Long> {

    List<Record> findByServiceIdOrderByRecordDateAsc(Long serviceId);

    List<Record> findByServiceIdAndRecordType(Long serviceId, String type);
}