<script>
  import HomeIcon from '$lib/icons/HomeIcon.svelte';
  import CourseIcon from '$lib/icons/CourseIcon.svelte';
  import ExercisesIcon from '$lib/icons/ExercisesIcon.svelte';
  import CommunityIcon from '$lib/icons/CommunityIcon.svelte';
  import SettingsIcon from '$lib/icons/SettingsIcon.svelte';
  import HelpIcon from '$lib/icons/HelpIcon.svelte';
  import UserIcon from '$lib/icons/UserIcon.svelte';

  import Avatar from '$lib/components/Avatar/index.svelte';

  import { sidebarStore } from '$lib/stores/sidebar';
  import { profileStore } from '$lib/stores/userProfile';

  let sidelinks = [];

  $: sidelinks = [
    {
      name: 'Home',
      icon: HomeIcon,
      link: '/lms',
    },
    {
      name: 'My Learning',
      icon: CourseIcon,
      link: '/lms/learning',
    },
    {
      name: 'Exercises',
      icon: ExercisesIcon,
      link: '/lms/exercises',
    },
    {
      name: 'Community',
      icon: CommunityIcon,
      link: '/lms/community',
    },
    {
      name: 'Settings',
      icon: SettingsIcon,
      link: '/lms/settings',
    },
    {
      name: 'Help',
      icon: HelpIcon,
      link: '/lms/help',
    },
  ];

  let activeLink = '/lms'; // Store the active link. Home '/lms' is the default active link.

  // Function to set the active link
  /**
   * @param {string} link
   */
  function setActiveLink(link) {
    activeLink = link;
  }

  const toggleSidebar = () => {
    $sidebarStore.hidden = !$sidebarStore.hidden;
  };
</script>


<aside
  class={`${$sidebarStore.hidden ? '-translate-x-[100%] absolute md:translate-x-0 md:relative z-40' : 'translate-x-0 absolute md:relative z-40'} overflow-y-auto transition w-[250px] min-w-[250px] bg-gray-100 h-[calc(100vh-48px)]`}
>
  <div class="h-full flex flex-col">
    <div class="border-b border-gray-200 pt-5 px-4">
      <!-- Shows profile pic only when uploaded. If default empty value, we show a generic UserIcon. -->
      <div class="w-full flex flex-col items-center">
        {#if $profileStore.avatar_url}
          <Avatar
            src={$profileStore.avatar_url}
            name={$profileStore.fullname}
            shape="rounded-full"
            width="w-20"
            height="h-20"
          />
        {:else}
          <div class="bg-white p-4 rounded-full"><UserIcon size="40" /></div>
        {/if}
        <p class="mt-5 text-lg font-bold truncate max-w-[80%] text-center">
          {$profileStore.fullname}
        </p>
      </div>

      <div>
        <ul class="my-5">
          {#each sidelinks as item (item.name)}
            <a
              href={item.link}
              on:click={() => setActiveLink(item.link)}
              on:click={() => toggleSidebar()}
              class="text-black"
            >
              <li
                class="flex items-center py-3 px-4 mb-2 hover:bg-gray-200 hover:text-black rounded 
                {activeLink === item.link
                  ? 'bg-gray-200 text-black transition delay-150 duration-300 ease-in-out'
                  : ''}"
              >
                <svelte:component this={item.icon} />
                <p class="ml-2">{item.name}</p>
              </li>
            </a>
          {/each}
        </ul>
      </div>

      <span class="flex-grow" />
    </div>
  </div>
</aside>
