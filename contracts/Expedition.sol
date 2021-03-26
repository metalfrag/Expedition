// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; //Version de solidity

contract Shipping { //Creation du contrat

    enum Etat{ Pending, Shipped, Delivered } // Definition des 3 etats
    Etat etatcommande;    
    event Attente(uint ID, Etat); //creation des evenements
    event Expedition(uint ID, Etat);
    event Livraison(uint ID, Etat);

    struct Commande { //definition d'une commande
        uint ID;
        string State;
    }
    function _creationcommande(uint ID) private { //fonction de création 
        etatcommande = Etat.Pending;
        emit Attente(ID, etatcommande); //Appel de l'evenement de creation 
    }

    function _expeditioncommande(uint ID) private { //Fonction d'expedition
        etatcommande = Etat.Shipped;
        emit Expedition(ID, etatcommande); //Appel de l'evenement d'expedition 
    }

    function _livraisoncommande(uint ID) private { //fonction de livraison 
        etatcommande = Etat.Delivered;
        emit Livraison(ID, etatcommande); //Appel de l'evenement de livraison 
    }
    
} 