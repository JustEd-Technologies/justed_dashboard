<script>
  import { page } from '$app/stores';

  import IconButton from '$lib/ui/IconButton/index.svelte';
  import MenuIcon from '$lib/icons/MenuIcon.svelte';
  import CloseIcon from '$lib/icons/CloseIcon.svelte';
  import NotificationIcon from '$lib/icons/NotificationIcon.svelte';

  import { sidebarStore } from '$lib/stores/sidebar';

  const toggleSidebar = () => {
    $sidebarStore.hidden = !$sidebarStore.hidden;
  };

  let notifications = 0;
  $: notifications = 0;

  let showNotifications = false;
  $: showNotifications = $page.url.pathname.includes('/lms');
</script>


<nav class="flex w-full p-2 md:px-6 bg-blue-800 h-[48px]">
  <ul class="flex w-full items-center">
    <!-- Shows Hamburger Menu only for small devices like mobiles. -->
    <li class="md:hidden mt-1 ml-2 mr-2">
      <IconButton onClick={toggleSidebar}>
        {#if $sidebarStore.hidden}
          <MenuIcon size="20" color="white" />
        {:else}
          <CloseIcon size="20" color="white" />
        {/if}
      </IconButton>
    </li>

    <div>
      <a href="/" class="text-xl flex items-center">
        Just<span class="text-blue-300">Ed</span>
      </a>
    </div>

    <span class="flex-grow" />

    <!-- Shows Notifications only when on LMS, not for other pages like homepage. -->
    {#if showNotifications}
      <li class="flex mr-4">
        <div class="m-1"><NotificationIcon size="20" color="white" /></div>
        <span class="text-white notification-count">{notifications}</span>
      </li>
    {/if}
  </ul>
</nav>


<style>
  ul {
    padding: 0;
  }

  ul::after {
    content: '';
    display: block;
    clear: both;
  }

  a {
    text-decoration: none;
    color: #fff;
    font-weight: 700;
  }

  .notification-count {
    background-color: #d9381e;
    border-radius: 12px; /* Adjust as needed for more or less rounded corners */
    padding: 0.2rem 0.5rem; /* Adjust padding as needed */
    display: inline-block;
  }

  @media only screen and (max-width: 1002px) {
    ul {
      align-items: center;
    }
    a {
      padding: 0 0.5em;
    }
  }
</style>
