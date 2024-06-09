import { writable } from 'svelte/store';

const defaultProfileState = {
  id: undefined,
  fullname: 'Test User',
  avatar_url: '',
  username: 'Test User',
  user_id: '',
  email: '',
  source: '',
  is_email_verified: false,
  verified_at: '',
};

export const profileStore = writable(defaultProfileState);
