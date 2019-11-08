package kz.epam.raiymbek.service;

import kz.epam.raiymbek.entity.InsertLog;

import java.util.List;

public interface InsertLogService {
    boolean addInsertLog(InsertLog insertLog);
    boolean deleteInsertLog(InsertLog insertLog);
    boolean editInsertLog(InsertLog insertLog);
    List<InsertLog> getAllInsertLogs();
    InsertLog getInsertLogById(int id);
}
