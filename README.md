# enjoy_cording_with_c

## visual studioで開発するときの注意 

1. Release / Debugを混同しない⇒本番環境にはC++ runtimeないため/MTを指定しdebugでビルドすると動かない  
2. DLLやlib,headerファイルなど、他のプロジェクトで共用するものは参照すべきディレクトリを明確にしておく  
3. x86やwin32など利用しないものは構成マネージャーから削除しておく⇒Gitからpullするとなにでビルドしたか分からなくなるため  
4. exeやdllなど成果物を登録する場合はLFS指定で。また、ソース変更時にexeがきちんと登録されているか確認。  
5. 
