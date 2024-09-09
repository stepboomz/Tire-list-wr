'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b24309bc13fa40bc3988d8e50d2ee58b",
"assets/AssetManifest.bin.json": "028d895b43d83cd763326709f31db99f",
"assets/AssetManifest.json": "8916439a61c0861a77cc2094e06a4791",
"assets/assets/aatrox.webp": "9b8ecffeb9a56ac0502019304a4de839",
"assets/assets/ahri.webp": "3a95cacef8073f3c1986427cd2b718c2",
"assets/assets/akali.webp": "5ca1ad97a6881949c1cc68815f52dbda",
"assets/assets/akshan.webp": "4fadea42152ecc7a5f80ea5c04706aeb",
"assets/assets/alistar.webp": "609619cf66287408c8f5884b11825b7b",
"assets/assets/All_icon.webp": "c1d564580194c3017aa471de6c6703f3",
"assets/assets/amumu.webp": "63135a263ad01f56e741eb35bb33383d",
"assets/assets/annie.webp": "fd15d1170ed073b9b8dbbb8c54742ed9",
"assets/assets/ashe.webp": "17eab19e63f9532e1d5e47aef29890f4",
"assets/assets/aurelion-sol.webp": "4ceeadf5f38b352f780944d83bd12c88",
"assets/assets/Baron_icon.webp": "2c693a3c4791d8e88d21f9f181773f21",
"assets/assets/blitzcrank.webp": "a3750bbba633c2e0aef3669957f98131",
"assets/assets/brand.webp": "4b03a648978c95edf45ea5193c376fb4",
"assets/assets/braum.webp": "427865c1831ed27c3fb13624c317e300",
"assets/assets/caitlyn.webp": "515357c5e5e25914336ed15132200557",
"assets/assets/camille.webp": "af61cbf19883a1a64df4fc55def99282",
"assets/assets/champs/aatrox.webp": "9b8ecffeb9a56ac0502019304a4de839",
"assets/assets/champs/ahri.webp": "3a95cacef8073f3c1986427cd2b718c2",
"assets/assets/champs/akali.webp": "5ca1ad97a6881949c1cc68815f52dbda",
"assets/assets/champs/akshan.webp": "4fadea42152ecc7a5f80ea5c04706aeb",
"assets/assets/champs/alistar.webp": "609619cf66287408c8f5884b11825b7b",
"assets/assets/champs/amumu.webp": "63135a263ad01f56e741eb35bb33383d",
"assets/assets/champs/annie.webp": "fd15d1170ed073b9b8dbbb8c54742ed9",
"assets/assets/champs/ashe.webp": "17eab19e63f9532e1d5e47aef29890f4",
"assets/assets/champs/aurelion-sol.webp": "4ceeadf5f38b352f780944d83bd12c88",
"assets/assets/champs/blitzcrank.webp": "a3750bbba633c2e0aef3669957f98131",
"assets/assets/champs/brand.webp": "4b03a648978c95edf45ea5193c376fb4",
"assets/assets/champs/braum.webp": "427865c1831ed27c3fb13624c317e300",
"assets/assets/champs/caitlyn.webp": "515357c5e5e25914336ed15132200557",
"assets/assets/champs/camille.webp": "af61cbf19883a1a64df4fc55def99282",
"assets/assets/champs/corki.webp": "5cd9668a4ac507749cd4a7112f0f9fab",
"assets/assets/champs/darius.webp": "3907aa11176f7478e592a5724d6a532c",
"assets/assets/champs/diana.webp": "b37449b5a795db021534249001c3c62f",
"assets/assets/champs/dr-mundo.webp": "6f0bda34c5f8505243be53551d391c6f",
"assets/assets/champs/draven.webp": "fe2f84e64692ecea9de4d952753ce61e",
"assets/assets/champs/ekko.webp": "a59a5157875f71e530d19f0a001a383a",
"assets/assets/champs/evelynn.webp": "8fecb8668fac9793f61ab6b5fc758ec1",
"assets/assets/champs/ezreal.webp": "0f9f2a3a6d5b15de25448e2ca7069ecd",
"assets/assets/champs/fiddlesticks.webp": "7a790b399d1808418393dc21a7d6f167",
"assets/assets/champs/fiora.webp": "68a2b2974016da53a1822398b7a05480",
"assets/assets/champs/fizz.webp": "3f627dcfb8c3ed9453e72e86e6b6ff12",
"assets/assets/champs/galio.webp": "9050cca8278cdc5b57ea7e7ce338ec2b",
"assets/assets/champs/garen.webp": "f157fd50efeed071d886052f6fa06a5c",
"assets/assets/champs/gragas.webp": "bbb49d2adae562d85e0f62a7dcfe912c",
"assets/assets/champs/graves.webp": "ec5910ee2dc41f87db9261c7eb6f83b6",
"assets/assets/champs/gwen.webp": "d224a1093ae52eaaa209ddc956b9337e",
"assets/assets/champs/hecarim.webp": "aebd99f4bba3a9d399029af4d160d5ec",
"assets/assets/champs/irelia.webp": "0f5f35cb65fd88b43a7843eb9a0b5d12",
"assets/assets/champs/janna.webp": "cc444a46c539dcbcf66d57be14dc6cf5",
"assets/assets/champs/jarvan-iv.webp": "fd5a5e5d54b0f65eb9d205bc59247a7c",
"assets/assets/champs/jax.webp": "d23efeefb20aa7cbf945e3d6122986f0",
"assets/assets/champs/jayce.webp": "f63b78d4a8f1809a739b257d3ec7bbbf",
"assets/assets/champs/jhin.webp": "0ac6433c86636e62e1e8a68ae68fa76f",
"assets/assets/champs/jinx.webp": "acf0796214140c154f9ef4048f694d51",
"assets/assets/champs/kaisa.webp": "3f96e3f2c0ccbdf5852b884e26d4dd78",
"assets/assets/champs/karma.webp": "fced5b06fa43bbeeb522282cbde4512c",
"assets/assets/champs/kassadin.webp": "c596d36e156e61ffbf2fc7c4e4883253",
"assets/assets/champs/katarina.webp": "e1a94be3d04dec7c82bb270aee464100",
"assets/assets/champs/kayle.webp": "56c6616dc5cb1176e7e97590d21f7d75",
"assets/assets/champs/kayn.webp": "355ec1a14d4ecd79932741833bfb4bfe",
"assets/assets/champs/kennen.webp": "6760be5cc208e677d93b0afeba33a738",
"assets/assets/champs/khazix.webp": "16b2cab971f54b0cf9c3408b96ac620d",
"assets/assets/champs/kindred.webp": "d0e4f397c518db0be53733041a222ef6",
"assets/assets/champs/lee-sin.webp": "62adbf1b9ef7e08bcc43932704a2a3a5",
"assets/assets/champs/leona.webp": "098412ffb76c5065974bb87c65a27e9c",
"assets/assets/champs/lillia.webp": "978591e94ce777165fa25aea54ffed85",
"assets/assets/champs/lucian.webp": "97dea4c8e9449b8e2c84ba460beed45c",
"assets/assets/champs/lulu.webp": "3f1ad0d6080e1d88496973f654d39ea4",
"assets/assets/champs/lux.webp": "22a180ad6244482ffed416e47d0f143e",
"assets/assets/champs/malphite.webp": "c51ba6aadd9aafebae6864747ce72982",
"assets/assets/champs/master-yi.webp": "1d54bd9c82f449805de1449dba78db7c",
"assets/assets/champs/miss-fortune.webp": "1889d72211ef4c60d6ee898f81e914a2",
"assets/assets/champs/morgana.webp": "fa07d52ef158033777af4e53bde8b64e",
"assets/assets/champs/nami.webp": "d84acc0f1748afb0f8e2811a57bd3001",
"assets/assets/champs/nasus.webp": "9560859bf8d9ddeb2081536647107009",
"assets/assets/champs/nautilus.webp": "abec5e65b860275092984c94ff4b1139",
"assets/assets/champs/nilah.webp": "282dbcad962e109e22b90717a9530e79",
"assets/assets/champs/nunu-and-willump.webp": "b68c99b0892c588fbc7b60052e627d89",
"assets/assets/champs/olaf.webp": "a179ed907ce9732f128b69a4d5e76122",
"assets/assets/champs/orianna.webp": "d256a566b6dec00c0ebac99dbe5394bf",
"assets/assets/champs/ornn.webp": "b259986cd423584c72b4db24f423fd12",
"assets/assets/champs/pantheon.webp": "b51edfb6d11185729f30ae7431d7e66f",
"assets/assets/champs/pyke.webp": "75006ca4500ae58872512aa4a856804f",
"assets/assets/champs/rakan.webp": "0d9452a66c7e93956f94a148f8ec98fa",
"assets/assets/champs/rammus.webp": "e3e3cd75997ea6b888777d478255c13f",
"assets/assets/champs/renekton.webp": "3472fac24f9dc86331efb034e491ada4",
"assets/assets/champs/rengar.webp": "6094f90b9bf0fe94d0946f49b71fd83d",
"assets/assets/champs/riven.webp": "ed265529f31e67885e3e4b3f7f59bfc6",
"assets/assets/champs/samira.webp": "a3a6fa0c1a0e16f9b74875dd9275fcb5",
"assets/assets/champs/senna.webp": "a817a52aefe35114fc2db7f20fe2c9bb",
"assets/assets/champs/seraphine.webp": "c3e22b280aaaff12efb8e468092b73df",
"assets/assets/champs/sett.webp": "3add6f2023259be1c8b63c132e79f4c0",
"assets/assets/champs/shen.webp": "122e5a05f09c55800dd57872354979a9",
"assets/assets/champs/shyvana.webp": "fc475f7162d26dda8d57f5370e9a688a",
"assets/assets/champs/singed.webp": "831f289c9dc7c9fde1b2606923cb102b",
"assets/assets/champs/sion.webp": "98ae39898f9796facb485d8c69052ec2",
"assets/assets/champs/sivir.webp": "e4bf9d71853e2cb8a718ebfb8b93b5be",
"assets/assets/champs/sona.webp": "ed8d13de754ccd0c733fb6c4075fcd38",
"assets/assets/champs/soraka.webp": "386cbfb5badef9ac86d6250df2a5f2f6",
"assets/assets/champs/swain.webp": "ed32666ebb39b11b72d33eb2d47ed698",
"assets/assets/champs/syndra.webp": "c7458ffe37cf7721a9cdf9c5d739a8a0",
"assets/assets/champs/talon.webp": "eea97ac2da46a4c2bffe2b8a996eb45d",
"assets/assets/champs/teemo.webp": "2bdc6526a290e74375b19e4f6425c2ed",
"assets/assets/champs/thresh.webp": "4f67546056c69ca0c8a2c9f1c642d517",
"assets/assets/champs/tristana.webp": "01419295a8c2c5760d9284f07e33ac31",
"assets/assets/champs/tryndamere.webp": "30358c37b23013c37ec7e09b0b1b85f3",
"assets/assets/champs/twisted-fate.webp": "99ea00a5de4a121bc79c13b829990e70",
"assets/assets/champs/twitch.webp": "2997ee61c3b8570a6e62af513d14f432",
"assets/assets/champs/urgot.webp": "01069551529feffc69a7015428af1142",
"assets/assets/champs/varus.webp": "499bc3ddd33d72e7681a4c86d07d02f8",
"assets/assets/champs/vayne.webp": "9733b00be432e34e2dea593b1edc91e5",
"assets/assets/champs/veigar.webp": "fa3721eb2b32d6383466ec66c1710aed",
"assets/assets/champs/vex.webp": "270b01bd95ed1658b9c0391a685035ba",
"assets/assets/champs/vi.webp": "6befb43ee4d7f8d89cdf243df5d8922a",
"assets/assets/champs/vladimir.webp": "6c6bc874e63caf882f405e89d1eed977",
"assets/assets/champs/volibear.webp": "84c1961769296ff4e607adf77ff53017",
"assets/assets/champs/warwick.webp": "17459c7a1237a40c62aea720037764f9",
"assets/assets/champs/wukong.webp": "ca8d1432b22d2bde4f7bd4c1d907f551",
"assets/assets/champs/xayah.webp": "b9a5b04d1cfb6bceb7faed5fb5b33836",
"assets/assets/champs/xin-zhao.webp": "893e385d5f0dc2d004d1e69712ace3cb",
"assets/assets/champs/yasuo.webp": "657db32ddd14749c8ee2d1c6c91cf5ef",
"assets/assets/champs/yone.webp": "2e43a3b638e69b5f84df4ebe0bf62c6c",
"assets/assets/champs/yuumi.webp": "fe2cd431f3c8590c6119446c11b75205",
"assets/assets/champs/zed.webp": "f0f02999911406dd30d5089c54f627f5",
"assets/assets/champs/zeri.webp": "85fb624aef968d81ccc052a3c8dfc180",
"assets/assets/champs/ziggs.webp": "b078440b9a0820252e035cdaecbdcd1f",
"assets/assets/champs/zoe.webp": "7fc8e133c7cad263ff9e3e2250dd622d",
"assets/assets/champs/zyra.webp": "56b727f22ae852107dfb0bf59e240e21",
"assets/assets/corki.webp": "5cd9668a4ac507749cd4a7112f0f9fab",
"assets/assets/darius.webp": "3907aa11176f7478e592a5724d6a532c",
"assets/assets/diana.webp": "b37449b5a795db021534249001c3c62f",
"assets/assets/dr-mundo.webp": "6f0bda34c5f8505243be53551d391c6f",
"assets/assets/Dragon_icon.webp": "e9427cc6666f27102d87ae3be5e7a4af",
"assets/assets/draven.webp": "fe2f84e64692ecea9de4d952753ce61e",
"assets/assets/ekko.webp": "a59a5157875f71e530d19f0a001a383a",
"assets/assets/evelynn.webp": "8fecb8668fac9793f61ab6b5fc758ec1",
"assets/assets/ezreal.webp": "0f9f2a3a6d5b15de25448e2ca7069ecd",
"assets/assets/fiddlesticks.webp": "7a790b399d1808418393dc21a7d6f167",
"assets/assets/fiora.webp": "68a2b2974016da53a1822398b7a05480",
"assets/assets/fizz.webp": "3f627dcfb8c3ed9453e72e86e6b6ff12",
"assets/assets/galio.webp": "9050cca8278cdc5b57ea7e7ce338ec2b",
"assets/assets/garen.webp": "f157fd50efeed071d886052f6fa06a5c",
"assets/assets/gragas.webp": "bbb49d2adae562d85e0f62a7dcfe912c",
"assets/assets/graves.webp": "ec5910ee2dc41f87db9261c7eb6f83b6",
"assets/assets/gwen.webp": "d224a1093ae52eaaa209ddc956b9337e",
"assets/assets/hecarim.webp": "aebd99f4bba3a9d399029af4d160d5ec",
"assets/assets/irelia.webp": "0f5f35cb65fd88b43a7843eb9a0b5d12",
"assets/assets/janna.webp": "cc444a46c539dcbcf66d57be14dc6cf5",
"assets/assets/jarvan-iv.webp": "fd5a5e5d54b0f65eb9d205bc59247a7c",
"assets/assets/jax.webp": "d23efeefb20aa7cbf945e3d6122986f0",
"assets/assets/jayce.webp": "f63b78d4a8f1809a739b257d3ec7bbbf",
"assets/assets/jhin.webp": "0ac6433c86636e62e1e8a68ae68fa76f",
"assets/assets/jinx.webp": "acf0796214140c154f9ef4048f694d51",
"assets/assets/Jungle_icon.webp": "ad3d9a99b6ab96beb5d58faa424802b8",
"assets/assets/kaisa.webp": "3f96e3f2c0ccbdf5852b884e26d4dd78",
"assets/assets/karma.webp": "fced5b06fa43bbeeb522282cbde4512c",
"assets/assets/kassadin.webp": "c596d36e156e61ffbf2fc7c4e4883253",
"assets/assets/katarina.webp": "e1a94be3d04dec7c82bb270aee464100",
"assets/assets/kayle.webp": "56c6616dc5cb1176e7e97590d21f7d75",
"assets/assets/kayn.webp": "355ec1a14d4ecd79932741833bfb4bfe",
"assets/assets/kennen.webp": "6760be5cc208e677d93b0afeba33a738",
"assets/assets/khazix.webp": "16b2cab971f54b0cf9c3408b96ac620d",
"assets/assets/kindred.webp": "d0e4f397c518db0be53733041a222ef6",
"assets/assets/lee-sin.webp": "62adbf1b9ef7e08bcc43932704a2a3a5",
"assets/assets/leona.webp": "098412ffb76c5065974bb87c65a27e9c",
"assets/assets/lillia.webp": "978591e94ce777165fa25aea54ffed85",
"assets/assets/lucian.webp": "97dea4c8e9449b8e2c84ba460beed45c",
"assets/assets/lulu.webp": "3f1ad0d6080e1d88496973f654d39ea4",
"assets/assets/lux.webp": "22a180ad6244482ffed416e47d0f143e",
"assets/assets/malphite.webp": "c51ba6aadd9aafebae6864747ce72982",
"assets/assets/master-yi.webp": "1d54bd9c82f449805de1449dba78db7c",
"assets/assets/Mid_icon.webp": "f5fc134640e264ba5ef0f9751bed5053",
"assets/assets/miss-fortune.webp": "1889d72211ef4c60d6ee898f81e914a2",
"assets/assets/morgana.webp": "fa07d52ef158033777af4e53bde8b64e",
"assets/assets/nami.webp": "d84acc0f1748afb0f8e2811a57bd3001",
"assets/assets/nasus.webp": "9560859bf8d9ddeb2081536647107009",
"assets/assets/nautilus.webp": "abec5e65b860275092984c94ff4b1139",
"assets/assets/nilah.webp": "282dbcad962e109e22b90717a9530e79",
"assets/assets/nunu-and-willump.webp": "b68c99b0892c588fbc7b60052e627d89",
"assets/assets/olaf.webp": "a179ed907ce9732f128b69a4d5e76122",
"assets/assets/orianna.webp": "d256a566b6dec00c0ebac99dbe5394bf",
"assets/assets/ornn.webp": "b259986cd423584c72b4db24f423fd12",
"assets/assets/pantheon.webp": "b51edfb6d11185729f30ae7431d7e66f",
"assets/assets/pyke.webp": "75006ca4500ae58872512aa4a856804f",
"assets/assets/rakan.webp": "0d9452a66c7e93956f94a148f8ec98fa",
"assets/assets/rammus.webp": "e3e3cd75997ea6b888777d478255c13f",
"assets/assets/renekton.webp": "3472fac24f9dc86331efb034e491ada4",
"assets/assets/rengar.webp": "6094f90b9bf0fe94d0946f49b71fd83d",
"assets/assets/riven.webp": "ed265529f31e67885e3e4b3f7f59bfc6",
"assets/assets/roles/All_icon.webp": "c1d564580194c3017aa471de6c6703f3",
"assets/assets/roles/Baron_icon.webp": "2c693a3c4791d8e88d21f9f181773f21",
"assets/assets/roles/Dragon_icon.webp": "e9427cc6666f27102d87ae3be5e7a4af",
"assets/assets/roles/Jungle_icon.webp": "ad3d9a99b6ab96beb5d58faa424802b8",
"assets/assets/roles/Mid_icon.webp": "f5fc134640e264ba5ef0f9751bed5053",
"assets/assets/roles/Support_icon.webp": "b698624ade27bf6dd757d3529f4153a5",
"assets/assets/samira.webp": "a3a6fa0c1a0e16f9b74875dd9275fcb5",
"assets/assets/senna.webp": "a817a52aefe35114fc2db7f20fe2c9bb",
"assets/assets/seraphine.webp": "c3e22b280aaaff12efb8e468092b73df",
"assets/assets/sett.webp": "3add6f2023259be1c8b63c132e79f4c0",
"assets/assets/shen.webp": "122e5a05f09c55800dd57872354979a9",
"assets/assets/shyvana.webp": "fc475f7162d26dda8d57f5370e9a688a",
"assets/assets/singed.webp": "831f289c9dc7c9fde1b2606923cb102b",
"assets/assets/sion.webp": "98ae39898f9796facb485d8c69052ec2",
"assets/assets/sivir.webp": "e4bf9d71853e2cb8a718ebfb8b93b5be",
"assets/assets/sona.webp": "ed8d13de754ccd0c733fb6c4075fcd38",
"assets/assets/soraka.webp": "386cbfb5badef9ac86d6250df2a5f2f6",
"assets/assets/Support_icon.webp": "b698624ade27bf6dd757d3529f4153a5",
"assets/assets/swain.webp": "ed32666ebb39b11b72d33eb2d47ed698",
"assets/assets/syndra.webp": "c7458ffe37cf7721a9cdf9c5d739a8a0",
"assets/assets/talon.webp": "eea97ac2da46a4c2bffe2b8a996eb45d",
"assets/assets/teemo.webp": "2bdc6526a290e74375b19e4f6425c2ed",
"assets/assets/thresh.webp": "4f67546056c69ca0c8a2c9f1c642d517",
"assets/assets/tristana.webp": "01419295a8c2c5760d9284f07e33ac31",
"assets/assets/tryndamere.webp": "30358c37b23013c37ec7e09b0b1b85f3",
"assets/assets/twisted-fate.webp": "99ea00a5de4a121bc79c13b829990e70",
"assets/assets/twitch.webp": "2997ee61c3b8570a6e62af513d14f432",
"assets/assets/urgot.webp": "01069551529feffc69a7015428af1142",
"assets/assets/varus.webp": "499bc3ddd33d72e7681a4c86d07d02f8",
"assets/assets/vayne.webp": "9733b00be432e34e2dea593b1edc91e5",
"assets/assets/veigar.webp": "fa3721eb2b32d6383466ec66c1710aed",
"assets/assets/vex.webp": "270b01bd95ed1658b9c0391a685035ba",
"assets/assets/vi.webp": "6befb43ee4d7f8d89cdf243df5d8922a",
"assets/assets/vladimir.webp": "6c6bc874e63caf882f405e89d1eed977",
"assets/assets/volibear.webp": "84c1961769296ff4e607adf77ff53017",
"assets/assets/warwick.webp": "17459c7a1237a40c62aea720037764f9",
"assets/assets/wukong.webp": "ca8d1432b22d2bde4f7bd4c1d907f551",
"assets/assets/xayah.webp": "b9a5b04d1cfb6bceb7faed5fb5b33836",
"assets/assets/xin-zhao.webp": "893e385d5f0dc2d004d1e69712ace3cb",
"assets/assets/yasuo.webp": "657db32ddd14749c8ee2d1c6c91cf5ef",
"assets/assets/yone.webp": "2e43a3b638e69b5f84df4ebe0bf62c6c",
"assets/assets/yuumi.webp": "fe2cd431f3c8590c6119446c11b75205",
"assets/assets/zed.webp": "f0f02999911406dd30d5089c54f627f5",
"assets/assets/zeri.webp": "85fb624aef968d81ccc052a3c8dfc180",
"assets/assets/ziggs.webp": "b078440b9a0820252e035cdaecbdcd1f",
"assets/assets/zoe.webp": "7fc8e133c7cad263ff9e3e2250dd622d",
"assets/assets/zyra.webp": "56b727f22ae852107dfb0bf59e240e21",
"assets/champs/aatrox.webp": "9b8ecffeb9a56ac0502019304a4de839",
"assets/champs/ahri.webp": "3a95cacef8073f3c1986427cd2b718c2",
"assets/champs/akali.webp": "5ca1ad97a6881949c1cc68815f52dbda",
"assets/champs/akshan.webp": "4fadea42152ecc7a5f80ea5c04706aeb",
"assets/champs/alistar.webp": "609619cf66287408c8f5884b11825b7b",
"assets/champs/amumu.webp": "63135a263ad01f56e741eb35bb33383d",
"assets/champs/annie.webp": "fd15d1170ed073b9b8dbbb8c54742ed9",
"assets/champs/ashe.webp": "17eab19e63f9532e1d5e47aef29890f4",
"assets/champs/aurelion-sol.webp": "4ceeadf5f38b352f780944d83bd12c88",
"assets/champs/blitzcrank.webp": "a3750bbba633c2e0aef3669957f98131",
"assets/champs/brand.webp": "4b03a648978c95edf45ea5193c376fb4",
"assets/champs/braum.webp": "427865c1831ed27c3fb13624c317e300",
"assets/champs/caitlyn.webp": "515357c5e5e25914336ed15132200557",
"assets/champs/camille.webp": "af61cbf19883a1a64df4fc55def99282",
"assets/champs/corki.webp": "5cd9668a4ac507749cd4a7112f0f9fab",
"assets/champs/darius.webp": "3907aa11176f7478e592a5724d6a532c",
"assets/champs/diana.webp": "b37449b5a795db021534249001c3c62f",
"assets/champs/dr-mundo.webp": "6f0bda34c5f8505243be53551d391c6f",
"assets/champs/draven.webp": "fe2f84e64692ecea9de4d952753ce61e",
"assets/champs/ekko.webp": "a59a5157875f71e530d19f0a001a383a",
"assets/champs/evelynn.webp": "8fecb8668fac9793f61ab6b5fc758ec1",
"assets/champs/ezreal.webp": "0f9f2a3a6d5b15de25448e2ca7069ecd",
"assets/champs/fiddlesticks.webp": "7a790b399d1808418393dc21a7d6f167",
"assets/champs/fiora.webp": "68a2b2974016da53a1822398b7a05480",
"assets/champs/fizz.webp": "3f627dcfb8c3ed9453e72e86e6b6ff12",
"assets/champs/galio.webp": "9050cca8278cdc5b57ea7e7ce338ec2b",
"assets/champs/garen.webp": "f157fd50efeed071d886052f6fa06a5c",
"assets/champs/gragas.webp": "bbb49d2adae562d85e0f62a7dcfe912c",
"assets/champs/graves.webp": "ec5910ee2dc41f87db9261c7eb6f83b6",
"assets/champs/gwen.webp": "d224a1093ae52eaaa209ddc956b9337e",
"assets/champs/hecarim.webp": "aebd99f4bba3a9d399029af4d160d5ec",
"assets/champs/irelia.webp": "0f5f35cb65fd88b43a7843eb9a0b5d12",
"assets/champs/janna.webp": "cc444a46c539dcbcf66d57be14dc6cf5",
"assets/champs/jarvan-iv.webp": "fd5a5e5d54b0f65eb9d205bc59247a7c",
"assets/champs/jax.webp": "d23efeefb20aa7cbf945e3d6122986f0",
"assets/champs/jayce.webp": "f63b78d4a8f1809a739b257d3ec7bbbf",
"assets/champs/jhin.webp": "0ac6433c86636e62e1e8a68ae68fa76f",
"assets/champs/jinx.webp": "acf0796214140c154f9ef4048f694d51",
"assets/champs/kaisa.webp": "3f96e3f2c0ccbdf5852b884e26d4dd78",
"assets/champs/karma.webp": "fced5b06fa43bbeeb522282cbde4512c",
"assets/champs/kassadin.webp": "c596d36e156e61ffbf2fc7c4e4883253",
"assets/champs/katarina.webp": "e1a94be3d04dec7c82bb270aee464100",
"assets/champs/kayle.webp": "56c6616dc5cb1176e7e97590d21f7d75",
"assets/champs/kayn.webp": "355ec1a14d4ecd79932741833bfb4bfe",
"assets/champs/kennen.webp": "6760be5cc208e677d93b0afeba33a738",
"assets/champs/khazix.webp": "16b2cab971f54b0cf9c3408b96ac620d",
"assets/champs/kindred.webp": "d0e4f397c518db0be53733041a222ef6",
"assets/champs/lee-sin.webp": "62adbf1b9ef7e08bcc43932704a2a3a5",
"assets/champs/leona.webp": "098412ffb76c5065974bb87c65a27e9c",
"assets/champs/lillia.webp": "978591e94ce777165fa25aea54ffed85",
"assets/champs/lucian.webp": "97dea4c8e9449b8e2c84ba460beed45c",
"assets/champs/lulu.webp": "3f1ad0d6080e1d88496973f654d39ea4",
"assets/champs/lux.webp": "22a180ad6244482ffed416e47d0f143e",
"assets/champs/malphite.webp": "c51ba6aadd9aafebae6864747ce72982",
"assets/champs/master-yi.webp": "1d54bd9c82f449805de1449dba78db7c",
"assets/champs/miss-fortune.webp": "1889d72211ef4c60d6ee898f81e914a2",
"assets/champs/morgana.webp": "fa07d52ef158033777af4e53bde8b64e",
"assets/champs/nami.webp": "d84acc0f1748afb0f8e2811a57bd3001",
"assets/champs/nasus.webp": "9560859bf8d9ddeb2081536647107009",
"assets/champs/nautilus.webp": "abec5e65b860275092984c94ff4b1139",
"assets/champs/nilah.webp": "282dbcad962e109e22b90717a9530e79",
"assets/champs/nunu-and-willump.webp": "b68c99b0892c588fbc7b60052e627d89",
"assets/champs/olaf.webp": "a179ed907ce9732f128b69a4d5e76122",
"assets/champs/orianna.webp": "d256a566b6dec00c0ebac99dbe5394bf",
"assets/champs/ornn.webp": "b259986cd423584c72b4db24f423fd12",
"assets/champs/pantheon.webp": "b51edfb6d11185729f30ae7431d7e66f",
"assets/champs/pyke.webp": "75006ca4500ae58872512aa4a856804f",
"assets/champs/rakan.webp": "0d9452a66c7e93956f94a148f8ec98fa",
"assets/champs/rammus.webp": "e3e3cd75997ea6b888777d478255c13f",
"assets/champs/renekton.webp": "3472fac24f9dc86331efb034e491ada4",
"assets/champs/rengar.webp": "6094f90b9bf0fe94d0946f49b71fd83d",
"assets/champs/riven.webp": "ed265529f31e67885e3e4b3f7f59bfc6",
"assets/champs/samira.webp": "a3a6fa0c1a0e16f9b74875dd9275fcb5",
"assets/champs/senna.webp": "a817a52aefe35114fc2db7f20fe2c9bb",
"assets/champs/seraphine.webp": "c3e22b280aaaff12efb8e468092b73df",
"assets/champs/sett.webp": "3add6f2023259be1c8b63c132e79f4c0",
"assets/champs/shen.webp": "122e5a05f09c55800dd57872354979a9",
"assets/champs/shyvana.webp": "fc475f7162d26dda8d57f5370e9a688a",
"assets/champs/singed.webp": "831f289c9dc7c9fde1b2606923cb102b",
"assets/champs/sion.webp": "98ae39898f9796facb485d8c69052ec2",
"assets/champs/sivir.webp": "e4bf9d71853e2cb8a718ebfb8b93b5be",
"assets/champs/sona.webp": "ed8d13de754ccd0c733fb6c4075fcd38",
"assets/champs/soraka.webp": "386cbfb5badef9ac86d6250df2a5f2f6",
"assets/champs/swain.webp": "ed32666ebb39b11b72d33eb2d47ed698",
"assets/champs/syndra.webp": "c7458ffe37cf7721a9cdf9c5d739a8a0",
"assets/champs/talon.webp": "eea97ac2da46a4c2bffe2b8a996eb45d",
"assets/champs/teemo.webp": "2bdc6526a290e74375b19e4f6425c2ed",
"assets/champs/thresh.webp": "4f67546056c69ca0c8a2c9f1c642d517",
"assets/champs/tristana.webp": "01419295a8c2c5760d9284f07e33ac31",
"assets/champs/tryndamere.webp": "30358c37b23013c37ec7e09b0b1b85f3",
"assets/champs/twisted-fate.webp": "99ea00a5de4a121bc79c13b829990e70",
"assets/champs/twitch.webp": "2997ee61c3b8570a6e62af513d14f432",
"assets/champs/urgot.webp": "01069551529feffc69a7015428af1142",
"assets/champs/varus.webp": "499bc3ddd33d72e7681a4c86d07d02f8",
"assets/champs/vayne.webp": "9733b00be432e34e2dea593b1edc91e5",
"assets/champs/veigar.webp": "fa3721eb2b32d6383466ec66c1710aed",
"assets/champs/vex.webp": "270b01bd95ed1658b9c0391a685035ba",
"assets/champs/vi.webp": "6befb43ee4d7f8d89cdf243df5d8922a",
"assets/champs/vladimir.webp": "6c6bc874e63caf882f405e89d1eed977",
"assets/champs/volibear.webp": "84c1961769296ff4e607adf77ff53017",
"assets/champs/warwick.webp": "17459c7a1237a40c62aea720037764f9",
"assets/champs/wukong.webp": "ca8d1432b22d2bde4f7bd4c1d907f551",
"assets/champs/xayah.webp": "b9a5b04d1cfb6bceb7faed5fb5b33836",
"assets/champs/xin-zhao.webp": "893e385d5f0dc2d004d1e69712ace3cb",
"assets/champs/yasuo.webp": "657db32ddd14749c8ee2d1c6c91cf5ef",
"assets/champs/yone.webp": "2e43a3b638e69b5f84df4ebe0bf62c6c",
"assets/champs/yuumi.webp": "fe2cd431f3c8590c6119446c11b75205",
"assets/champs/zed.webp": "f0f02999911406dd30d5089c54f627f5",
"assets/champs/zeri.webp": "85fb624aef968d81ccc052a3c8dfc180",
"assets/champs/ziggs.webp": "b078440b9a0820252e035cdaecbdcd1f",
"assets/champs/zoe.webp": "7fc8e133c7cad263ff9e3e2250dd622d",
"assets/champs/zyra.webp": "56b727f22ae852107dfb0bf59e240e21",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "37d30ad076d6938fb5e7b7647e5f0eff",
"assets/NOTICES": "49ef7f096c3483f983284c64f70e59b1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"flutter_bootstrap.js": "c168518cbc0ceadf987a3e2cfce14032",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fef2d385c7c4cbef3462970755801d49",
"/": "fef2d385c7c4cbef3462970755801d49",
"main.dart.js": "d7a264878bad65e6c712b68a5f20506f",
"manifest.json": "8fefce2be3012d5f2a32fea192d29b67",
"version.json": "f0c2fa9a6d1761a475fbd47e0b9f48d9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
