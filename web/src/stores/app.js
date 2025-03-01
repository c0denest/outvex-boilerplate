import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useAppStore = defineStore('app', () => {
  // State
  const isNuiOpen = ref(false)
  const isLoading = ref(false)
  const darkMode = ref(true)
  const notifications = ref([])
  
  // Getters
  const notificationCount = computed(() => notifications.value.length)
  const hasNotifications = computed(() => notificationCount.value > 0)
  
  // Actions
  function setNuiState(state) {
    isNuiOpen.value = state
  }
  
  function toggleDarkMode() {
    darkMode.value = !darkMode.value
    
    // Add/remove dark class to HTML element
    if (darkMode.value) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }
  
  function addNotification(notification) {
    // Create notification object
    const newNotification = {
      id: Date.now(),
      type: notification.type || 'info',
      message: notification.message,
      timeout: notification.timeout || 3000,
      ...notification
    }
    
    // Add to notifications
    notifications.value.push(newNotification)
    
    // Remove notification after specified timeout
    if (newNotification.timeout > 0) {
      setTimeout(() => {
        removeNotification(newNotification.id)
      }, newNotification.timeout)
    }
    
    return newNotification.id
  }
  
  function removeNotification(id) {
    const index = notifications.value.findIndex(n => n.id === id)
    if (index !== -1) {
      notifications.value.splice(index, 1)
    }
  }
  
  function clearNotifications() {
    notifications.value = []
  }
  
  function setLoading(state) {
    isLoading.value = state
  }
  
  // Return store
  return {
    // State
    isNuiOpen,
    isLoading,
    darkMode,
    notifications,
    
    // Getters
    notificationCount,
    hasNotifications,
    
    // Actions
    setNuiState,
    toggleDarkMode,
    addNotification,
    removeNotification,
    clearNotifications,
    setLoading
  }
}) 