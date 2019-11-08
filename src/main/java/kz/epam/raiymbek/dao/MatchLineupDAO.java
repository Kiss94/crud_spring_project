package kz.epam.raiymbek.dao;

import kz.epam.raiymbek.entity.MatchLineup;

import java.util.List;

public interface MatchLineupDAO {
    List<MatchLineup> listAllMatchLineups();
    boolean add(MatchLineup matchLineup);
    boolean delete(MatchLineup matchLineup);
    boolean edit(MatchLineup matchLineup);
    MatchLineup getMatchLineup(int id);
}
