package kz.epam.raiymbek.mapper;


import kz.epam.raiymbek.entity.InsertLog;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertLogMapper implements RowMapper {
    private static final String LOG_ID = "log_id";
    private static final String INSERT_DATE = "insert_date";
    private static final String REFERENCES_TABLE_NAME = "references_table_name";
    private static final String DESCTRIPTION = "desctription";
   @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
       InsertLog insertLog = new InsertLog();
       insertLog.setLogId(resultSet.getInt(LOG_ID));
       insertLog.setInsertDate(resultSet.getDate(INSERT_DATE));
       insertLog.setReferencesTableName(resultSet.getString(REFERENCES_TABLE_NAME));
       insertLog.setDescription(resultSet.getString(DESCTRIPTION));
       return insertLog;
    }
}
