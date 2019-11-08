package kz.epam.raiymbek.mapper;


import kz.epam.raiymbek.entity.GoalStatistic;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GoalStatisticMapper implements RowMapper {
    private static final String GOAL_ID = "goal_id";
    private static final String MATCH_ID = "match_id";
    private static final String PLAYER_ID = "player_id";
    private static final String MINUTE_OF_GOAL = "minute_of_goal";

    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        GoalStatistic goalStatistic = new GoalStatistic();
        goalStatistic.setGoalId(resultSet.getInt(GOAL_ID));
        goalStatistic.setMatchId(resultSet.getInt(MATCH_ID));
        goalStatistic.setPlayerId(resultSet.getInt(PLAYER_ID));
        goalStatistic.setMinuteOfGoal(resultSet.getInt(MINUTE_OF_GOAL));
        return goalStatistic;
    }
}
