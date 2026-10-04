# Jadual Pemerhatian Praktikum — Prof. Teh Ling

Laman web ringkas untuk guru pelatih di bawah penyeliaan **Prof. Teh Ling** merekod tarikh, masa, pautan video/RPH dan catatan bagi Pemerhatian 1 dan 2. Semua perubahan dikongsi secara langsung kepada semua pengguna. Pengguna **tidak perlu akaun** untuk membuka laman ini.

- Hos: GitHub Pages (percuma)
- Pangkalan data: Firebase Cloud Firestore (pelan percuma Spark)

## Persediaan (sekali sahaja, ±10 minit)

### 1. Cipta projek Firebase
1. Buka https://console.firebase.google.com dan log masuk dengan akaun Google.
2. **Add project** → beri nama, contoh `jadual-pemerhatian` → Google Analytics boleh dimatikan → **Create**.
3. Menu kiri: **Build → Firestore Database → Create database** → pilih lokasi `asia-southeast1 (Singapore)` → mula dalam **production mode**.
4. Tab **Rules** → padam semua, tampal kandungan fail `firestore.rules` dalam repo ini → **Publish**.
5. ⚙️ **Project settings → General → Your apps → ikon `</>` (Web)** → beri nama → **Register app**.
6. Salin objek `firebaseConfig` yang dipaparkan.

### 2. Isi konfigurasi
Buka fail `firebase-config.js` dalam repo ini (ikon pensel di GitHub) dan gantikan nilai `ISI_...` dengan nilai daripada langkah 1.6. Commit.

### 3. Hidupkan GitHub Pages
Repo → **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main` / `(root)` → **Save**.
Selepas 1–2 minit, laman tersedia di: `https://<username-github>.github.io/<nama-repo>/`

Kali pertama laman dibuka, 16 jadual asal (daripada senarai WhatsApp) akan dimasukkan secara automatik.

## Fail
| Fail | Fungsi |
|---|---|
| `index.html` | Keseluruhan aplikasi (UI + logik) |
| `firebase-config.js` | Konfigurasi Firebase projek anda |
| `firestore.rules` | Peraturan keselamatan Firestore (tampal di Firebase console) |

## Nota keselamatan
Sesiapa yang ada pautan boleh menambah, mengubah dan memadam jadual — sama seperti senarai dalam grup WhatsApp. Kongsi pautan hanya dalam grup penyeliaan. Peraturan dalam `firestore.rules` mengehadkan jenis dan saiz data yang boleh disimpan.
