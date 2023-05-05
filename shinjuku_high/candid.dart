type User__3 = 
 variant {
   address: AccountIdentifier;
   "principal": principal;
 };
type TransferResponse = 
 variant {
   err:
    variant {
      CannotNotify: AccountIdentifier;
      InsufficientBalance;
      InvalidToken: TokenIdentifier__5;
      Other: text;
      Rejected;
      Unauthorized: AccountIdentifier;
    };
   ok: Balance;
 };
type TransferRequest = 
 record {
   amount: Balance;
   from: User__3;
   memo: Memo;
   notify: bool;
   subaccount: opt SubAccount;
   to: User__3;
   token: TokenIdentifier__5;
 };
type TokenIndex = nat32;
type TokenIdentifier__6 = text;
type TokenIdentifier__5 = text;
type Time__1 = int;
type Time = int;
type SubAccount = vec nat8;
type Result__1_2 = 
 variant {
   err: CommonError;
   ok: Balance__1;
 };
type Result__1_1 = 
 variant {
   err: CommonError;
   ok: AccountIdentifier__3;
 };
type Result__1 = 
 variant {
   err: CommonError;
   ok: Metadata;
 };
type Result_9 = 
 variant {
   err: CommonError;
   ok: vec TokenIndex;
 };
type Result_8 = 
 variant {
   err: CommonError;
   ok: vec record {
             TokenIndex;
             opt Listing__1;
             opt blob;
           };
 };
type Result_12 = 
 variant {
   err: CommonError;
   ok: bool;
 };
type Result_11 = 
 variant {
   err: CommonError;
   ok: Metadata;
 };
type Result_10 = 
 variant {
   err: CommonError;
   ok: Balance__1;
 };
type Property = 
 record {
   trait_type: text;
   value: text;
 };
type MintRequest = 
 record {
   metadata: opt blob;
   to: User__3;
 };
type MetadataStorageType = 
 variant {
   Fleek;
   Last;
   MetaBox;
   S3;
 };
type MetadataStorageInfo = 
 record {
   thumb: text;
   url: text;
 };
type Metadata = 
 variant {
   fungible:
    record {
      decimals: nat8;
      metadata: opt blob;
      name: text;
      symbol: text;
    };
   nonfungible: record {metadata: opt blob;};
 };
type Memo = blob;
type Listing__1 = 
 record {
   locked: opt Time__1;
   price: nat64;
   seller: principal;
 };
type HttpResponse = 
 record {
   body: blob;
   headers: vec HeaderField;
   status_code: nat16;
 };
type HttpRequest = 
 record {
   body: blob;
   headers: vec HeaderField;
   method: text;
   url: text;
 };
type HeaderField = 
 record {
   text;
   text;
 };
type Extension = text;
type CommonError__1 = 
 variant {
   InvalidToken: TokenIdentifier__5;
   Other: text;
 };
type CommonError = 
 variant {
   InvalidToken: TokenIdentifier__5;
   Other: text;
 };
type Balance__1 = nat;
type BalanceResponse = 
 variant {
   err: CommonError__1;
   ok: Balance;
 };
type BalanceRequest = 
 record {
   token: TokenIdentifier__5;
   user: User__3;
 };
type Balance = nat;
type ApproveRequest = 
 record {
   allowance: Balance;
   spender: principal;
   subaccount: opt SubAccount;
   token: TokenIdentifier__5;
 };
type AllowanceRequest = 
 record {
   owner: User__3;
   spender: principal;
   token: TokenIdentifier__5;
 };
type AccountIdentifier__3 = text;
type AccountIdentifier = text;
service : {
  acceptCycles: () -> ();
  addMetadataStorageType: (text) -> () oneway;
  addMetadataUrlMany:
   (vec record {
          MetadataStorageType;
          TokenIndex;
          MetadataStorageInfo;
        }) -> () oneway;
  allowance: (AllowanceRequest) -> (Result__1_2) query;
  approve: (ApproveRequest) -> (bool);
  approveAll: (vec ApproveRequest) -> (vec TokenIndex);
  availableCycles: () -> (nat) query;
  balance: (BalanceRequest) -> (BalanceResponse) query;
  batchMintNFT: (vec MintRequest) -> (vec TokenIndex);
  batchTransfer: (vec TransferRequest) -> (vec TransferResponse);
  bearer: (TokenIdentifier__6) -> (Result__1_1) query;
  deleteMetadataStorageType: (text) -> () oneway;
  extensions: () -> (vec Extension) query;
  getAllowances: () -> (vec record {
                              TokenIndex;
                              principal;
                            }) query;
  getIsOpen: (TokenIdentifier__6) -> (Result_12);
  getMedataStorageType: () -> (vec text);
  getMinter: () -> (principal) query;
  getNFTMetadata: () -> (vec Metadata);
  getOpenTime: () -> (Time);
  getProperties: () -> (vec record {
                              text;
                              vec record {
                                    text;
                                    nat;
                                  };
                            }) query;
  getRegistry: () -> (vec record {
                            TokenIndex;
                            AccountIdentifier__3;
                          }) query;
  getRootBucketId: () -> (opt text);
  getScore: () -> (vec record {
                         TokenIndex;
                         float64;
                       }) query;
  getStorageMetadataUrl: (MetadataStorageType, TokenIndex) ->
   (record {
      text;
      text;
    });
  getTokens: () -> (vec record {
                          TokenIndex;
                          Metadata;
                        }) query;
  getTokensByIds: (vec TokenIndex) ->
   (vec record {
          TokenIndex;
          Metadata;
        }) query;
  getTokensByProperties: (vec record {
                                text;
                                vec text;
                              }) -> (vec record {
                                           TokenIndex;
                                           Metadata;
                                         }) query;
  getTokenspageable: (TokenIndex, TokenIndex) ->
   (vec record {
          TokenIndex;
          Metadata;
        }) query;
  http_request: (HttpRequest) -> (HttpResponse) query;
  initCap: () -> (opt text);
  initLastMetadata: (TokenIndex, TokenIndex) -> ();
  initproperties: (vec TokenIndex) -> ();
  lookProperties: () -> (vec record {
                               Property;
                               vec TokenIndex;
                             }) query;
  lookPropertyScoreByTokenId: () ->
   (vec record {
          TokenIndex;
          vec record {
                Property;
                int64;
              };
        }) query;
  metadata: (TokenIdentifier__6) -> (Result__1) query;
  mintNFT: (MintRequest) -> (TokenIndex);
  open: (TokenIdentifier__6) -> (Result_11);
  putNFTMetadata: (vec Metadata) -> ();
  replaceMetadata: (MetadataStorageType, TokenIndex, TokenIndex) -> ();
  setMinter: (principal) -> ();
  setOpenTime: (Time) -> ();
  setScoreOfTokenId: (int64) -> ();
  supply: (TokenIdentifier__6) -> (Result_10) query;
  tokens: (AccountIdentifier__3) -> (Result_9) query;
  tokens_ext: (AccountIdentifier__3) -> (Result_8) query;
  transfer: (TransferRequest) -> (TransferResponse);
  updateNFTMetadata: (vec Metadata) -> ();
}

