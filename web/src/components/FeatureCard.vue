<!-- Feature Card Component -->
<template>
  <div class="bg-gray-800 rounded-lg p-6 shadow-lg hover:bg-gray-700 transition-colors">
    <div class="flex items-center mb-4">
      <!-- Icon -->
      <div class="bg-blue-500 p-3 rounded-full mr-4">
        <component :is="getIcon" class="h-6 w-6 text-white" />
      </div>
      
      <!-- Title -->
      <h3 class="text-xl font-semibold text-blue-300">{{ title }}</h3>
    </div>
    
    <!-- Description -->
    <p class="text-gray-300">{{ description }}</p>
  </div>
</template>

<script setup>
import { computed } from 'vue';

// Component properties
const props = defineProps({
  title: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  icon: {
    type: String,
    default: 'default'
  }
});

// Calculate icon component
const getIcon = computed(() => {
  switch (props.icon) {
    case 'code':
      return CodeIcon;
    case 'brush':
      return BrushIcon;
    case 'globe':
      return GlobeIcon;
    default:
      return DefaultIcon;
  }
});

// Icon components
const CodeIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
      </svg>
    );
  }
};

const BrushIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01" />
      </svg>
    );
  }
};

const GlobeIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    );
  }
};

const DefaultIcon = {
  render() {
    return (
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    );
  }
};
</script> 