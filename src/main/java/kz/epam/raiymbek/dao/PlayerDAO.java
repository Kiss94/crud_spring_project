package kz.epam.raiymbek.dao;

import kz.epam.raiymbek.entity.Player;

import java.util.List;

public interface PlayerDAO {
    List<Player> listAllPlayers();
    boolean add(Player player);
    boolean delete(Player player);
    boolean edit(Player player);
    Player getPlayer(int id);
}
