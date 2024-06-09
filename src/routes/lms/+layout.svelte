<script>
  import Sidebar from '$lib/components/Sidebar/index.svelte';
</script>

<div class="flex w-full">
  <Sidebar />
  <div class="flex justify-center items-center w-full">
    <slot />
  </div>
</div>
