package kz.epam.raiymbek.service.impl;

import kz.epam.raiymbek.dao.impl.MatchLineupDAOImpl;
import kz.epam.raiymbek.entity.MatchLineup;
import kz.epam.raiymbek.service.MatchLineupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MatchLineupServiceImpl implements MatchLineupService {
    @Autowired
    private MatchLineupDAOImpl matchLineupDAO;
    @Override
    public boolean addMatchLineup(MatchLineup matchLineup) {
        return matchLineupDAO.add(matchLineup);
    }

    @Override
    public boolean deleteMatchLineup(MatchLineup matchLineup) {
        return matchLineupDAO.delete(matchLineup);
    }

    @Override
    public boolean editMatchLineup(MatchLineup matchLineup) {
        return matchLineupDAO.edit(matchLineup);
    }

    @Override
    public List<MatchLineup> getAllMatchLineups() {
        return matchLineupDAO.listAllMatchLineups();
    }

    @Override
    public MatchLineup getMatchLineupById(int id) {
        return matchLineupDAO.getMatchLineup(id);
    }
}
