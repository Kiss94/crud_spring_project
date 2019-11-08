package kz.epam.raiymbek.service;

import kz.epam.raiymbek.entity.MatchLineup;

import java.util.List;

public interface MatchLineupService {
    boolean addMatchLineup(MatchLineup matchLineup);
    boolean deleteMatchLineup(MatchLineup matchLineup);
    boolean editMatchLineup(MatchLineup matchLineup);
    List<MatchLineup> getAllMatchLineups();
    MatchLineup getMatchLineupById(int id);
}
