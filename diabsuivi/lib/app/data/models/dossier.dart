class Dossier {
  int? id;
  String? qrCode;
  String? image;
  String? numeroCarte;
  int? detailsCommandeId;
  String? designation;
  int? duree;
  String? dateLivraison;
  String? dateExpirationDoc;
  int? nbreMvt;
  String? statutDocument;
  String? numeroDocument;
  String? nom;

  Dossier(
      {this.id,
      this.qrCode,
      this.image,
      this.numeroCarte,
      this.detailsCommandeId,
      this.designation,
      this.duree,
      this.dateLivraison,
      this.dateExpirationDoc,
      this.nbreMvt,
      this.statutDocument,
      this.numeroDocument,
      this.nom});

  Dossier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrCode = json['Qr_code'];
    image = json['image'];
    numeroCarte = json['numero_carte'];
    detailsCommandeId = json['details_commande_id'];
    designation = json['designation'];
    duree = json['duree'];
    dateLivraison = json['date_livraison'];
    dateExpirationDoc = json['date_expiration_doc'];
    nbreMvt = json['nbre_mvt'];
    statutDocument = json['statut_document'];
    numeroDocument = json['numero_document'];
    nom = json['nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dossier_id'] =id;
    // data['Qr_code'] = qrCode;
    // data['image'] = image;
    // data['numero_carte'] = numeroCarte;
    // data['details_commande_id'] = detailsCommandeId;
    // data['designation'] = designation;
    // data['duree'] = duree;
    // data['date_livraison'] = dateLivraison;
    // data['date_expiration_doc'] = dateExpirationDoc;
    // data['nbre_mvt'] = nbreMvt;
    // data['statut_document'] = statutDocument;
    // data['numero_document'] = numeroDocument;
    // data['nom'] = nom;
    return data;
  }
}