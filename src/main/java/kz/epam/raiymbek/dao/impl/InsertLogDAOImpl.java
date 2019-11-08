package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.dao.InsertLogDAO;
import kz.epam.raiymbek.entity.InsertLog;
import kz.epam.raiymbek.mapper.InsertLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class InsertLogDAOImpl implements InsertLogDAO {
    private JdbcTemplate jdbcTemplate;
    private static final String SQL_FIND_LOG = "SELECT * FROM INSERT_LOGS WHERE log_id = ?";
    private static final String SQL_GET_ALL = "SELECT * FROM INSERT_LOGS";
    private static final String SQL_DELETE_LOG = "DELETE FROM INSERT_LOGS WHERE log_id = ?";
    private static final String SQL_UPDATE_LOG = "UPDATE INSERT_LOGS SET insert_date = ?, references_table_name = ?, desctription = ?";
    private static final String SQL_INSERT_LOG = "INSERT INTO INSERT_LOGS (insert_date, references_table_name, desctription) VALUES (?, ?, ?)";

    @Autowired
    public InsertLogDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<InsertLog> listAllInsertLogs() {
        return jdbcTemplate.query(SQL_GET_ALL, new InsertLogMapper());
    }

    @Override
    public boolean add(InsertLog insertLog) {
        return jdbcTemplate.update(SQL_INSERT_LOG, insertLog.getInsertDate(), insertLog.getReferencesTableName(), insertLog.getDescription()) > 0;
    }

    @Override
    public boolean delete(InsertLog insertLog) {
        return jdbcTemplate.update(SQL_DELETE_LOG, insertLog.getLogId()) > 0;
    }

    @Override
    public boolean edit(InsertLog insertLog) {
        return jdbcTemplate.update(SQL_UPDATE_LOG, insertLog.getInsertDate(), insertLog.getReferencesTableName(), insertLog.getDescription()) > 0;
    }

    @Override
    public InsertLog getInsertLog(int id) {
        return (InsertLog) jdbcTemplate.queryForObject(SQL_FIND_LOG, new Object [] { id}, new InsertLogMapper());
    }
}
