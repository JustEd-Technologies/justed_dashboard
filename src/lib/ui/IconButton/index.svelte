<script lang="ts">
  export let color = '';
  export let selected = false;
  export let disabled = false;
  export let contained = false;
  export let size = 'large';
  export let type: 'button' | 'submit' | 'reset' | null | undefined = 'button';

  export let stopPropagation = false;
  export let onClick = () => {};

  function handleClick(e: Event) {
    if (stopPropagation) {
      e.stopPropagation();
    }
    onClick();
  }
</script>

<button
  class="root {color} {selected && 'active'} {disabled &&
    'disabled'} {contained && 'contained'} {size}"
  {disabled}
  {type}
  on:click={handleClick}
>
  <slot />
</button>
