<!-- Notification System Component -->
<template>
  <div class="fixed top-4 right-4 z-50 flex flex-col gap-2 max-w-md">
    <TransitionGroup name="notification">
      <div
        v-for="notification in notifications"
        :key="notification.id"
        :class="[
          'notification p-4 rounded-lg shadow-lg flex items-start gap-3 animate-fade-in',
          getNotificationClass(notification.type)
        ]"
      >
        <!-- Icon -->
        <div class="flex-shrink-0">
          <component :is="getNotificationIcon(notification.type)" class="h-6 w-6" />
        </div>
        
        <!-- Content -->
        <div class="flex-grow">
          <div v-if="notification.title" class="font-semibold mb-1">{{ notification.title }}</div>
          <div>{{ notification.message }}</div>
        </div>
        
        <!-- Close button -->
        <button 
          @click="removeNotification(notification.id)" 
          class="flex-shrink-0 text-gray-400 hover:text-gray-200 transition-colors"
          aria-label="Close notification"
        >
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </TransitionGroup>
  </div>
</template>

<script setup>
import { useAppStore } from '../stores/app';
import { storeToRefs } from 'pinia';
import { TransitionGroup } from 'vue';

// Get notifications from store
const appStore = useAppStore();
const { notifications } = storeToRefs(appStore);
const { removeNotification } = appStore;

// Return class based on notification type
function getNotificationClass(type) {
  switch (type) {
    case 'success':
      return 'bg-green-800 text-green-100';
    case 'error':
      return 'bg-red-800 text-red-100';
    case 'warning':
      return 'bg-yellow-800 text-yellow-100';
    case 'info':
    default:
      return 'bg-blue-800 text-blue-100';
  }
}

// Return icon based on notification type
function getNotificationIcon(type) {
  switch (type) {
    case 'success':
      return SuccessIcon;
    case 'error':
      return ErrorIcon;
    case 'warning':
      return WarningIcon;
    case 'info':
    default:
      return InfoIcon;
  }
}

// Icon components
const SuccessIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    );
  }
};

const ErrorIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    );
  }
};

const WarningIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-yellow-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
      </svg>
    );
  }
};

const InfoIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    );
  }
};
</script>

<style scoped>
.notification-enter-active,
.notification-leave-active {
  transition: all 0.3s ease;
}

.notification-enter-from {
  opacity: 0;
  transform: translateX(30px);
}

.notification-leave-to {
  opacity: 0;
  transform: translateX(30px);
}
</style> 