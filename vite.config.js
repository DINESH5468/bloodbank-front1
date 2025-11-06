import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd())

  console.log('Building for mode:', mode)
  console.log('Using base:', env.VITE_BASE_URL)

  return {
    plugins: [react()],
    base: env.VITE_BASE_URL || '/',  // ✅ default fallback
    build: {
      outDir: 'dist',
    },
    server: {
      port: 5173,
      strictPort: true,
    },
  }
})
