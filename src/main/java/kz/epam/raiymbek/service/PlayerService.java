package kz.epam.raiymbek.service;

import kz.epam.raiymbek.entity.Player;

import java.util.List;

public interface PlayerService {
    boolean addPlayer(Player player);
    boolean deletePlayer(Player player);
    boolean editPlayer(Player player);
    List<Player> getAllPlayers();
    Player getPlayerById(int id);
}
