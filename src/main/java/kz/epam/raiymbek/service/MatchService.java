package kz.epam.raiymbek.service;

import kz.epam.raiymbek.entity.Match;

import java.util.List;

public interface MatchService {
    boolean addMatch(Match match);
    boolean deleteMatch(Match match);
    boolean editMatch(Match match);
    List<Match> getAllMatches();
    Match getMatchById(int id);
}
