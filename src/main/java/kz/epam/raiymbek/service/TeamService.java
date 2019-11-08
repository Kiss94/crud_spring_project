package kz.epam.raiymbek.service;

import kz.epam.raiymbek.entity.Team;

import java.util.List;

public interface TeamService {
    boolean addTeam(Team team);
    boolean deleteTeam(Team team);
    boolean editTeam(Team team);
    List<Team> getAllTeams();
    Team getTeamById(int id);
}
