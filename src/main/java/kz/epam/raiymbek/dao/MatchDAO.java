package kz.epam.raiymbek.dao;

import kz.epam.raiymbek.entity.Match;

import java.util.List;

public interface MatchDAO {
    List<Match> listAllMatches();
    boolean add(Match match);
    boolean delete(Match match);
    boolean edit(Match match);
    Match getMatch(int id);
}
