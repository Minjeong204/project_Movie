drop table member;
drop table movie cascade CONSTRAINTS;
drop table reviews;


CREATE TABLE MEMBER(
   id VARCHAR2(20) PRIMARY KEY, --���̵�
   pw VARCHAR2(20), --��й�ȣ
   email VARCHAR2(50), --�̸���
   tel VARCHAR2(20), --��ȭ��ȣ
   birth DATE --�������
);

CREATE TABLE movie(
   movieNo number primary key, 
   movieName VARCHAR2(100), 
   category number, 
   runtime number, 
   img VARCHAR2(300), 
   info VARCHAR2(200) 
);

create table reviews(
    num number(8) default 0,
    id varchar2(20),
    content varchar2(200) NOT NULL,
    movieNo number(8),
    score number(15) DEFAULT 0,
    writedate Date
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10000,
'��ȭ��',
2,
120,
'https://w.namu.la/s/6f1ee7e71b0355ce7983a100f67b8f62111a16a37d79dfe1b1b1719735d5dd6515ab5928f8a9e347a9ce5e90aa0fe1012f337047478829cacfc7921390b5656473c8591b19009f1e420bad3a8d8c725fdabb892d380c0baf32e2e2c543a9cc5751da3c70022716b2f203d4d472427bb0',
'����'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10001,
'���˵���',
1,
121,
'https://w.namu.la/s/5c57ebe049d9678ff7159dbb3184cdaf8e05f4d4c04c9b52c622ece7c460304d8d5ca2eb2348557ae591adb5840d5fcef183b38d96e3e60c19ec76a0a15e86e6361e08f63c1a4c132f44dc732b1ab7d7049238e8bf6fc0536718ac3686debfb24f396c4aedcd80cc4fb533d5e74f27f6',
'�����ϰ�! ȭ���ϰ�! ����ϰ�! ���� ��� ������� ���¹� ������� ������ ���� �������� ���۵ȴ�!'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10002,
'���׶�',
1,
124,
'https://w.namu.la/s/1d6ed89b28e72ddd439b36d69582ecd36f6461094c1cf8de9f92169c6beb22039647293e8c30725dd6093c50da02c48403ceaddf617b45962dcfad60bec33717e6775726ade603ff4075b24fea72790195bc6e72b41a27cf061c363f7e89d1073e27fb09a7ea5af164293c0fa2cadac3',
'���׶� ��������� VS ���Ƶ��� ��� 3��, �������� �� ���� ����� ���۵ȴ�!'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10003,
'�����а���',
2,
118,
'https://w.namu.la/s/c5cbdb11e56d71d8b79e696b2d0d2481b9ae4ee10257e96b82187d3b094120e778c3f16a3c16bb86c38c09283ca09c02555f6d22ea3a05e8d8460c6f715176636cb161f0aef77ec5041f4f722cf68d3cac7d603ffd0e9b2d1be64afae812110c4158da85db150558a478d1ab021deca1',
'���� ù����� ���ƿԴ�! ���޽Խθ��� ����̾߱�'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10004,
'û�����',
3,
109,
'https://w.namu.la/s/43a077a95ca17c5cb84ea8624ce78f17a201c658faaf4e10fcbe40846b739f1efe974074e583a4d37a51c85426a757305d05df0f3fc53a45eedec77a0609e2aeb41cc3db2b3e3415b18c0ee0dfae8c9c43dd1fd90d235e6d503b93460c985f999e422604326d45e5338921084934764b',
'���� ���̶�� �ָ԰� ���� ���� �� ��������� ���տ��� ����� ��ġ��ǿ� �ָ����鼭 �������� �̾߱�'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10005,
'����',
3,
115,
'https://w.namu.la/s/5b663b0963a60094e8fadbc12b62915bbb9b5b1f72d4d3cff528ee96c0e39c9e3401452f3c19881b83740219cb8a8a15fe3aec5e997e1aec57fbd1ab3fa5a797c57002ca68edbabc2ac0ee04ac6efaf7391339699a75f8c36ad9ba4d2aff453afedd48ccc6a3ad6472789cc51164bebe',
'���� ���̶�� �ָ԰� ���� ���� �� ��������� ���տ��� ����� ��ġ��ǿ� �ָ����鼭 �������� �̾߱�'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10006,
'�� �÷���',
4,
94,
'https://w.namu.la/s/4144604e3586b013a36aca8d9d18272ac64ff474abc642d7d97d8abd3175c4699997bd0424024fab1fa8e787d19fd57292b75804f069579b8c5952de4aa9ad6f6fa945315c994216bce36deeadb32ae400cb843e6f5a85a37107e783fdccc647551279d1ef4a1ba78b0741e2fe24e1a3',
'30�ϸ��� �������� ������ �ٲ�� ���� ������ ���� ���� �ֻ��� ���� 0���� �Ʒ��� ���������� ���ĵ� �ΰ����� �ٴڳ��µ���'
);
insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10007,
'���� ġ������ ���Ҹ�',
5,
126,
'https://w.namu.la/s/05bb6389be97a3eeab64cc747ce3ed780774d6692b0feb5b42d7cf1a1fee21380fce9088c25e9111aa56a66f1bb73b3b50530221c0e206500ad246e4c49ffe6457a4f1555f8236786bece665dffb0db3725f131612e2d50d8a73d8b4817b09a4571dd92152a5346368b4af1ebb43404f',
'�ͳ��� ������, �ź��� �����̾����ϴ�.'
);

insert into movie
(
movieno,
moviename,
category,
runtime,
img,
info
)
VALUES
(
10008,
'�͸��� Į��: ���ѿ�����',
5,
117,
'https://w.namu.la/s/0239cd770651e4255e0de336abbd3406c152e301af94a1c9188ede6aabc991cabf5b0de6d3b79da7878b01350f482e77c8491302bf165a75f08e1ae4cfa7c49557043f26dc5d9dbdaaee7c0c1a17e59b6df56369fe04007af571f8e75b27b8b72a11a12b4e9a9c7b427b9b122da4799b',
'�������̰� ��������� �ִϸ��̼�'
);

commit;