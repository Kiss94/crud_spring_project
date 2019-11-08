package kz.epam.raiymbek.dao;

import kz.epam.raiymbek.entity.Team;

import java.util.List;

public interface TeamDAO {
    List<Team> listAllTeams();
    boolean add(Team team);
    boolean delete(Team team);
    boolean edit(Team team);
    Team getTeam(int id);
}
