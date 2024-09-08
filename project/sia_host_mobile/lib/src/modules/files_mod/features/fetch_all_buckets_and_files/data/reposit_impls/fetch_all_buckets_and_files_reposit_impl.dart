import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/features/fetch_user_credentials/data/local_source/absts/fetch_the_user_credential_abst.dart';
import '../../../../../../shared/global/list_variable.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/cryptography/requests/decrypt_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/bucket_entity.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/reposit_absts/fetch_all_buckets_and_files_reposit_abst.dart';
import '../remote_source/absts/fetch_all_buckets_abst.dart';
import '../remote_source/absts/fetch_files_from_bucket_abst.dart';
import '../remote_source/models/bucket_model.dart';
import '../remote_source/models/file_model.dart';

@LazySingleton(as: FetchAllBucketsAndFilesRepositAbst)
class FetchAllBucketsAndFilesRepositImpl
    implements FetchAllBucketsAndFilesRepositAbst {
  final FetchTheUserCredentialAbst _fetchTheUserCredentialAbst;
  final FetchAllBucketsAbst _fetchAllBucketsAbst;
  final FetchFilesFromBucketAbst _fetchFilesFromBucketAbst;

  FetchAllBucketsAndFilesRepositImpl({
    required FetchTheUserCredentialAbst fetchTheUserCredentialAbst,
    required FetchAllBucketsAbst fetchAllBucketsAbst,
    required FetchFilesFromBucketAbst fetchFilesFromBucketAbst,
  })  : _fetchTheUserCredentialAbst = fetchTheUserCredentialAbst,
        _fetchAllBucketsAbst = fetchAllBucketsAbst,
        _fetchFilesFromBucketAbst = fetchFilesFromBucketAbst;

  var _allBucketList = <BucketEntity>[];
  var _allFilesList = <FileEntity>[];

  @override
  Future<Result<List<BucketEntity>, String>> fetchAllBuckets() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return _fetchTheUserCredentialAbst
          .fetchUserCredential()
          .then((_resultCredential) async {
        if (_resultCredential["status"] == false) {
          return const Result.error(Lang.makeLoginDemandText);
        } else {
          global.userInfo = json.decode(_resultCredential["data"]);

          return await _fetchAllBucketsAbst
              .fetchListOfBucket(
            serverAddress: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userServerAdress"]),
            // password: EncrypterRequest.decrypt(
            //     dataEncrypted: global.userInfo["userPassWord"]),
            key: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userKey"]),
            iv: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userIv"]),
          )
              .then((_bucketResponse) async {
            if (_bucketResponse["status"] == true &&
                (_bucketResponse["response"] as Response<String>).statusCode ==
                    HttpStatus.ok) {
              _allBucketList.clear();
              List<dynamic> _allBucketFound =
                  json.decode(DecryptRequest.decryptStringWithAES256CBC(
                chipherText: json.decode(
                    (_bucketResponse["response"] as Response<String>)
                        .data!)["data"],
                key: EncrypterRequest.decrypt(
                    dataEncrypted: global.userInfo["userKey"]),
                iv: EncrypterRequest.decrypt(
                    dataEncrypted: global.userInfo["userIv"]),
              ));

              for (var index = 0; index < _allBucketFound.length; index++) {
                Map<String, dynamic> _bucketMap = _allBucketFound[index];
                var _bucketModel = BucketModel.fromMap(_bucketMap);
                var _bucketFilesTotal = 0;
                var _fetchAllFileOfBucketResponse =
                    await _fetchFilesFromBucketAbst.fetchAllFilesOfBucket(
                  serverAddress: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userServerAdress"]),
                  // password: EncrypterRequest.decrypt(
                  //     dataEncrypted: global.userInfo["userPassWord"]),
                  bucketName: _bucketModel.nameBucket,
                  prefixPath: "",
                  key: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userKey"]),
                  iv: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userIv"]),
                );

                if (_fetchAllFileOfBucketResponse["status"] == true &&
                    (_fetchAllFileOfBucketResponse["response"]
                                as Response<String>)
                            .statusCode ==
                        HttpStatus.ok) {
                  Map<String, dynamic> _dataFiles =
                      json.decode(DecryptRequest.decryptStringWithAES256CBC(
                    chipherText: json.decode(
                        (_fetchAllFileOfBucketResponse["response"]
                                as Response<String>)
                            .data!)["data"],
                    key: EncrypterRequest.decrypt(
                        dataEncrypted: global.userInfo["userKey"]),
                    iv: EncrypterRequest.decrypt(
                        dataEncrypted: global.userInfo["userIv"]),
                  ));

                  _bucketFilesTotal = _dataFiles["objects"] == null
                      ? 0
                      : ((_dataFiles["objects"] as List<dynamic>).where(
                              (element) =>
                                  !(element["name"] as String).endsWith("/")))
                          .length;
                }

                _allBucketList.add(
                  BucketEntity(
                    nameBucket: _bucketModel.nameBucket,
                    totalFiles: _bucketFilesTotal,
                  ),
                );
                bucketNameList.add(_bucketModel.nameBucket);
              }

              return Result.success(_allBucketList.reversed.toList());
            } else if (_bucketResponse["status"] == true &&
                (_bucketResponse["response"] as Response<String>).statusCode !=
                    HttpStatus.ok) {
              _allBucketList.clear();
              return const Result.error(Lang.internalServerErrorText);
            } else if (_bucketResponse["status"] == false &&
                    (_bucketResponse["error"] as DioException).type ==
                        DioExceptionType.connectionTimeout ||
                (_bucketResponse["error"] as DioException).type ==
                    DioExceptionType.receiveTimeout) {
              _allBucketList.clear();
              return const Result.error(Lang.timeErrorText);
            } else {
              _allBucketList.clear();
              return const Result.error(Lang.internalServerErrorText);
            }
          });
        }
      });
    } else {
      _allBucketList.clear();
      return const Result.error(Lang.noConnectionText);
    }
  }

  @override
  Future<Result<List<FileEntity>, String>> fetchAllFilesFromBucket({
    required String bucketName,
    required String prefix,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _fetchFilesFromBucketAbst
          .fetchAllFilesOfBucket(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        // password: EncrypterRequest.decrypt(
        //     dataEncrypted: global.userInfo["userPassWord"]),
        bucketName: bucketName,
        prefixPath: prefix,
        key:
            EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userKey"]),
        iv: EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userIv"]),
      )
          .then((_response) {
        if (_response["status"] == true &&
            (_response["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          Map<String, dynamic> _data =
              json.decode(DecryptRequest.decryptStringWithAES256CBC(
            chipherText: json.decode(
                (_response["response"] as Response<String>).data!)["data"],
            key: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userKey"]),
            iv: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userIv"]),
          ));
          if (_data["objects"] == null) {
            _allFilesList.clear();
            return const Result.error(Lang.noFileText);
          } else {
            _allFilesList.clear();
            for (var index = 0;
                index < (_data["objects"] as List<dynamic>).length;
                index++) {
              var _dataMap = (_data["objects"] as List<dynamic>)[index];
              var _fileModel = FileModel.fromMap(_dataMap);

              if (RegExp("/").allMatches(_fileModel.name).length > 1) {
                if (_fileModel.name.startsWith("/") &&
                    _fileModel.name.endsWith("/")) {
                  var _fileType = "folder";
                  var _folderName = _fileModel.name;
                  var _folderFiles = (_data["objects"] as List<dynamic>)
                      .where((file) =>
                          (file["name"] as String).startsWith(_folderName) &&
                          file["mimeType"] == null)
                      .toList();
                  var _folderSizeTotal = 0;

                  for (var _file in _folderFiles) {
                    int _sizeFile = _file["size"];
                    _folderSizeTotal += _sizeFile;
                  }
                  _allFilesList.add(FileEntity(
                    eTag: _fileModel.eTag,
                    health: _fileModel.health,
                    modTime: _fileModel.modTime,
                    name: _fileModel.name,
                    fileType: _fileType,
                    totalFiles: _folderFiles.length,
                    size: _folderSizeTotal,
                  ));
                }
              } else {
                _allFilesList.add(FileEntity(
                  eTag: _fileModel.eTag,
                  health: _fileModel.health,
                  modTime: _fileModel.modTime,
                  name: _fileModel.name,
                  fileType: _fileModel.fileType,
                  size: _fileModel.size,
                ));
              }
            }
          }
          return Result.success(_allFilesList.reversed.toList());
        } else if (_response["status"] == false &&
                (_response["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_response["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          _allFilesList.clear();
          return const Result.error(Lang.timeErrorText);
        } else {
          _allFilesList.clear();
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      _allFilesList.clear();
      return const Result.error(Lang.noConnectionText);
    }
  }

  @override
  Future<Result<List<FileEntity>, String>> fetchAllFilesFromFolder({
    required String bucketName,
    required String prefix,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _fetchFilesFromBucketAbst
          .fetchAllFilesOfBucket(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        // password: EncrypterRequest.decrypt(
        //     dataEncrypted: global.userInfo["userPassWord"]),
        bucketName: bucketName,
        prefixPath: prefix,
        key:
            EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userKey"]),
        iv: EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userIv"]),
      )
          .then((_response) {
        if (_response["status"] &&
            (_response["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          Map<String, dynamic> _data =
              json.decode(DecryptRequest.decryptStringWithAES256CBC(
            chipherText: json.decode(
                (_response["response"] as Response<String>).data!)["data"],
            key: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userKey"]),
            iv: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userIv"]),
          ));
          if (_data["objects"] == null) {
            _allFilesList.clear();
            return const Result.error(Lang.noFileText);
          } else {
            _allFilesList.clear();
            for (var index = 0;
                index < (_data["objects"] as List<dynamic>).length;
                index++) {
              var _dataMap = (_data["objects"] as List<dynamic>)[index];
              var _fileModel = FileModel.fromMap(_dataMap);

              if (_fileModel.name != prefix) {
                if (RegExp("/").allMatches(_fileModel.name).length > 1) {
                  if (_fileModel.name.startsWith("/") &&
                      _fileModel.name.endsWith("/")) {
                    var _fileType = "folder";
                    var _folderName = _fileModel.name;
                    var _folderFiles = (_data["objects"] as List<dynamic>)
                        .where((file) =>
                            (file["name"] as String).startsWith(_folderName) &&
                            file["mimeType"] == null)
                        .toList();
                    var _folderSizeTotal = 0;

                    for (var _file in _folderFiles) {
                      int _sizeFile = _file["size"];
                      _folderSizeTotal += _sizeFile;
                    }
                    _allFilesList.add(FileEntity(
                      eTag: _fileModel.eTag,
                      health: _fileModel.health,
                      modTime: _fileModel.modTime,
                      name: _fileModel.name,
                      fileType: _fileType,
                      totalFiles: _folderFiles.length,
                      size: _folderSizeTotal,
                    ));
                  }
                } else {
                  _allFilesList.add(FileEntity(
                    eTag: _fileModel.eTag,
                    health: _fileModel.health,
                    modTime: _fileModel.modTime,
                    name: _fileModel.name,
                    fileType: _fileModel.fileType,
                    size: _fileModel.size,
                  ));
                }
              }
            }
          }
          return Result.success(_allFilesList.reversed.toList());
        } else if (_response["status"] == false &&
                (_response["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_response["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          _allFilesList.clear();
          return const Result.error(Lang.timeErrorText);
        } else {
          _allFilesList.clear();
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      _allFilesList.clear();
      return const Result.error(Lang.noConnectionText);
    }
  }
}
