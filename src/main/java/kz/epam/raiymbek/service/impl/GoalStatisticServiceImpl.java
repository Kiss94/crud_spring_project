package kz.epam.raiymbek.service.impl;

import kz.epam.raiymbek.dao.impl.GoalStatisticDAOImpl;
import kz.epam.raiymbek.entity.GoalStatistic;
import kz.epam.raiymbek.service.GoalStatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GoalStatisticServiceImpl implements GoalStatisticService {
    @Autowired
    private GoalStatisticDAOImpl goalStatisticDAO;
    @Override
    public boolean addGoalStatistic(GoalStatistic goalStatistic) {
        return goalStatisticDAO.add(goalStatistic);
    }

    @Override
    public boolean deleteGoalStatistic(GoalStatistic goalStatistic) {
        return goalStatisticDAO.delete(goalStatistic);
    }

    @Override
    public boolean editGoalStatistic(GoalStatistic goalStatistic) {
        return goalStatisticDAO.edit(goalStatistic);
    }

    @Override
    public List<GoalStatistic> getAllGoalStatistics() {
        return goalStatisticDAO.listAllGoalStatistic();
    }

    @Override
    public GoalStatistic getGoalStatisticById(int id) {
        return goalStatisticDAO.getGoalStatistic(id);
    }
}
