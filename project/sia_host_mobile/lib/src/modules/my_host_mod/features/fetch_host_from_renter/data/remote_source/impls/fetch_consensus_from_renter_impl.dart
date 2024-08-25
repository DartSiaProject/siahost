import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/fetch_consensus_from_renter_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchTheConsensus]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: FetchConsensusFromRenterAbst)
class FetchConsensusFromRenterImpl implements FetchConsensusFromRenterAbst {
  /// Note : cette fonction permet de récupérer un consensus depuis Renter

  @override
  Future<Map<String, dynamic>> fetchTheConsensus({
    required String serverAddress,
    required String password,
  }) async {
    return await Consensus.getState(
      password: password,
      serverAddress: serverAddress,
    );
  }
}
