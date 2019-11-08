package kz.epam.raiymbek.service.impl;

import kz.epam.raiymbek.dao.impl.MatchDAOImpl;
import kz.epam.raiymbek.entity.Match;
import kz.epam.raiymbek.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MatchServiceImpl implements MatchService {
    @Autowired
    private MatchDAOImpl matchDAO;
    @Override
    public boolean addMatch(Match match) {
        return matchDAO.add(match);
    }

    @Override
    public boolean deleteMatch(Match match) {
        return matchDAO.delete(match);
    }

    @Override
    public boolean editMatch(Match match) {
        return matchDAO.edit(match);
    }

    @Override
    public List<Match> getAllMatches() {
        return matchDAO.listAllMatches();
    }

    @Override
    public Match getMatchById(int id) {
        return matchDAO.getMatch(id);
    }
}
