<!-- Outvex Boilerplate Main Component -->
<template>
  <div class="min-h-screen bg-gray-900 text-white">
    <!-- NUI Close Button -->
    <button 
      @click="closeNUI" 
      class="absolute top-4 right-4 p-2 rounded-full bg-red-500 hover:bg-red-600 transition-colors"
      aria-label="Close"
    >
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>

    <!-- Main Content -->
    <div class="container mx-auto px-4 py-8">
      <!-- Logo and Title -->
      <div class="text-center mb-8">
        <h1 class="text-4xl font-bold text-blue-400 mb-2">{{ $t('app.title') }}</h1>
        <p class="text-xl text-gray-300">{{ $t('app.description') }}</p>
      </div>

      <!-- Welcome Card -->
      <div class="bg-gray-800 rounded-lg p-6 shadow-lg mb-8">
        <h2 class="text-2xl font-semibold text-blue-300 mb-4">{{ $t('app.welcome') }}</h2>
        <p class="text-gray-300">
          Bu boilerplate, FiveM için Vue 3, Vite ve TailwindCSS kullanılarak hazırlanmıştır.
          Keymaster, escrowed ve locale desteği ile güncel teknolojileri içerir.
        </p>
        
        <!-- Test Buttons -->
        <div class="mt-4 flex flex-wrap gap-2">
          <button 
            @click="showNotification('success')" 
            class="btn btn-primary"
          >
            Başarı Bildirimi
          </button>
          <button 
            @click="showNotification('error')" 
            class="btn btn-danger"
          >
            Hata Bildirimi
          </button>
          <button 
            @click="showNotification('warning')" 
            class="btn btn-secondary"
          >
            Uyarı Bildirimi
          </button>
          <button 
            @click="showNotification('info')" 
            class="btn btn-secondary"
          >
            Bilgi Bildirimi
          </button>
        </div>
      </div>

      <!-- Features Section -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <FeatureCard 
          title="Vue 3 & Vite" 
          description="Modern web geliştirme için en güncel araçlar"
          icon="code"
        />
        <FeatureCard 
          title="TailwindCSS" 
          description="Hızlı ve özelleştirilebilir stil sistemi"
          icon="brush"
        />
        <FeatureCard 
          title="Çoklu Dil Desteği" 
          description="i18n ile kolay dil entegrasyonu"
          icon="globe"
        />
      </div>

      <!-- Language Selection -->
      <div class="bg-gray-800 rounded-lg p-4 flex justify-center items-center space-x-4">
        <span class="text-gray-300">{{ $t('settings.language') }}:</span>
        <button 
          @click="changeLanguage('tr')" 
          :class="['px-3 py-1 rounded', locale === 'tr' ? 'bg-blue-500' : 'bg-gray-700 hover:bg-gray-600']"
        >
          Türkçe
        </button>
        <button 
          @click="changeLanguage('en')" 
          :class="['px-3 py-1 rounded', locale === 'en' ? 'bg-blue-500' : 'bg-gray-700 hover:bg-gray-600']"
        >
          English
        </button>
      </div>
    </div>
    
    <!-- Notification System -->
    <NotificationSystem />
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import { useI18n } from 'vue-i18n';
import { useAppStore } from './stores/app';
import FeatureCard from './components/FeatureCard.vue';
import NotificationSystem from './components/NotificationSystem.vue';

// i18n setup
const { locale } = useI18n();

// Store
const appStore = useAppStore();

// Variables for NUI communication
const resourceName = 'outvex-boilerplate';
const isNuiReady = ref(false);

// Language change function
function changeLanguage(lang) {
  locale.value = lang;
}

// Close NUI function
function closeNUI() {
  fetch(`https://${resourceName}/close`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({}),
  });
}

// Test notification display function
function showNotification(type) {
  const messages = {
    success: 'İşlem başarıyla tamamlandı!',
    error: 'Bir hata oluştu!',
    warning: 'Dikkat! Bu bir uyarı mesajıdır.',
    info: 'Bu bir bilgi mesajıdır.'
  };
  
  const titles = {
    success: 'Başarılı',
    error: 'Hata',
    warning: 'Uyarı',
    info: 'Bilgi'
  };
  
  appStore.addNotification({
    type,
    title: titles[type],
    message: messages[type]
  });
}

// NUI message listener
function handleMessage(event) {
  const data = event.data;

  if (data.action === 'open') {
    isNuiReady.value = true;
    appStore.setNuiState(true);
  } else if (data.action === 'close') {
    isNuiReady.value = false;
    appStore.setNuiState(false);
  }
}

// When component is mounted
onMounted(() => {
  window.addEventListener('message', handleMessage);
  
  // Welcome notification
  setTimeout(() => {
    appStore.addNotification({
      type: 'info',
      title: 'Hoş Geldiniz',
      message: 'Outvex Boilerplate başarıyla yüklendi!'
    });
  }, 1000);
});

// When component is unmounted
onUnmounted(() => {
  window.removeEventListener('message', handleMessage);
});
</script>

<style>
/* General style definitions */
body {
  margin: 0;
  font-family: 'Inter', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  overflow: hidden;
}
</style>
