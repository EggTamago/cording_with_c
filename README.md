# enjoy_cording_with_c

## visual studioで開発するときの注意 

1. Release / Debugを混同しない⇒本番環境にはC++ runtimeないため/MTを指定しdebugでビルドすると動かない  
2. DLLやlib,headerファイルなど、他のプロジェクトで共用するものはなるべく参照すべきディレクトリを明確にしておく  
3. x86やwin32など利用しないものは構成マネージャーから削除しておく⇒Gitからpullするとなにでビルドしたか分からなくなるため  
