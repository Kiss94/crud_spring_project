package kz.epam.raiymbek.service.impl;

import kz.epam.raiymbek.dao.impl.InsertLogDAOImpl;
import kz.epam.raiymbek.entity.InsertLog;
import kz.epam.raiymbek.service.InsertLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class InsertLogServiceImpl implements InsertLogService {
    @Autowired
    private InsertLogDAOImpl insertLogDAO;
    @Override
    public boolean addInsertLog(InsertLog insertLog) {
        return insertLogDAO.add(insertLog);
    }

    @Override
    public boolean deleteInsertLog(InsertLog insertLog) {
        return insertLogDAO.delete(insertLog);
    }

    @Override
    public boolean editInsertLog(InsertLog insertLog) {
        return insertLogDAO.edit(insertLog);
    }

    @Override
    public List<InsertLog> getAllInsertLogs() {
        return insertLogDAO.listAllInsertLogs();
    }

    @Override
    public InsertLog getInsertLogById(int id) {
        return insertLogDAO.getInsertLog(id);
    }
}
