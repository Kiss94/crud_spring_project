package kz.epam.raiymbek.dao;

import kz.epam.raiymbek.entity.InsertLog;

import java.util.List;

public interface InsertLogDAO {
    List<InsertLog> listAllInsertLogs();
    boolean add(InsertLog insertLog);
    boolean delete(InsertLog insertLog);
    boolean edit(InsertLog insertLog);
    InsertLog getInsertLog(int id);
}
