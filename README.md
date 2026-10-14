# Mi Plata Tranquila (app web)

Presupuesto de sueldo a sueldo. Funciona en el navegador, se instala en el celular como app
y sincroniza tus datos entre dispositivos con Supabase (gratis).

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `index.html` | La app completa |
| `config.js` | Aquí van la URL y la clave pública de tu Supabase |
| `supabase/schema.sql` | Crea la tabla y las reglas de seguridad |
| `manifest.webmanifest`, `sw.js`, `icons/` | Permiten instalarla en el celular |
| `.nojekyll` | Necesario para GitHub Pages |

## Paso 1: Supabase (base de datos y cuentas)

1. Entra a <https://supabase.com>, crea una cuenta y un **New project** (región: São Paulo es la más cercana).
2. Ve a **SQL Editor → New query**, pega todo `supabase/schema.sql` y presiona **Run**.
3. Ve a **Project Settings → API** y copia:
   - **Project URL**
   - La clave **anon public** (no la `service_role`).
4. Pégalas en `config.js`.

## Paso 2: GitHub Pages (hosting)

1. Crea un repositorio en GitHub, por ejemplo `mi-plata-tranquila`.
2. Sube **todos** los archivos de esta carpeta (incluido `.nojekyll`).
3. En el repositorio: **Settings → Pages → Branch: main / root → Save**.
4. En un minuto queda en `https://TU-USUARIO.github.io/mi-plata-tranquila/`.

## Paso 3: Avisarle a Supabase cuál es tu sitio

En Supabase: **Authentication → URL Configuration**

- **Site URL:** `https://TU-USUARIO.github.io/mi-plata-tranquila/`
- **Redirect URLs:** agrega esa misma dirección.

Así los correos de confirmación y de "olvidé mi contraseña" te llevan a tu app.

## Paso 4: Instalar en el celular

- **iPhone (Safari):** abre la dirección → botón Compartir → **Agregar a pantalla de inicio**.
- **Android (Chrome):** abre la dirección → menú ⋮ → **Instalar app**.

## Paso 5: Traer tus datos desde la versión de Claude

1. En la versión de Claude: **Mi plan → Respaldo → Preparar respaldo → Copiar**.
2. En la app nueva (ya con tu cuenta): **Mi plan → Respaldo → Importar un respaldo**, pega y confirma.

## Bueno saber

- Supabase gratis pausa un proyecto si pasa ~7 días casi sin uso. Los datos no se pierden:
  se reactiva en el panel con **Resume project**.
- Si `config.js` no está completo, la app funciona igual pero guarda solo en ese navegador.
- Para publicar cambios: reemplaza `index.html` en GitHub. Si cambias `sw.js`, sube el número
  de `CACHE` (por ejemplo `mpt-v2`) para que los celulares tomen la versión nueva.
