// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Déclaration contrat
contract contractEnvoieColis{

    // Déclaration de l'état du colis 
    enum Etat{ Pending, Shipped, Delivered }
        Etat etat;

    // Déclaration de la structure 
    struct Marchandise{
        bytes32 name;
        uint numero_id;
        uint heureDepart;
        uint heureEnvoie;
        uint heureArrive;
        Etat etat;
    }

    // Déclaration de l'event Création
    event Creation(
        Etat choix
    );

    // Déclaration de l'event Création
    event Expedition (
        Etat choix
    );

    // Déclaration de l'event Création
    event Execution (
        Etat choix
    );

    // Création de la marchandise
    Marchandise marchandise;

    // Déclaration de la fonction Start, au depart le colis n'a pas d'heure d'arrivee
    function Start(uint id, bytes32 name) public{
    
        marchandise.etat = Etat.Pending;
        marchandise.name = name;
        marchandise.numero_id = id;
        marchandise.heureDepart = block.timestamp;
        emit Creation(etat);
    }

    // Focntion d'envoie du colis
    function Envoie() public{
        marchandise.etat = Etat.Shipped;
        marchandise.heureEnvoie = block.timestamp;
        emit Expedition(etat);
    }

    // Fonction d'arrivée du colis
    function Fin() public{
        marchandise.etat = Etat.Delivered;
        marchandise.heureArrive = block.timestamp;
        emit Execution(etat);
    }
}