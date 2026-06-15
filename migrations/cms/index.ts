import * as migration_20260603_192730_initial from './20260603_192730_initial';
import * as migration_20260605_180139 from './20260605_180139';
import * as migration_20260608_155405_add_prefix_to_media from './20260608_155405_add_prefix_to_media';
import * as migration_20260615_144644_add_drafts_status from './20260615_144644_add_drafts_status';
import * as migration_20260615_145551_add_scheduled_publish_and_published_at from './20260615_145551_add_scheduled_publish_and_published_at';

export const migrations = [
  {
    up: migration_20260603_192730_initial.up,
    down: migration_20260603_192730_initial.down,
    name: '20260603_192730_initial',
  },
  {
    up: migration_20260605_180139.up,
    down: migration_20260605_180139.down,
    name: '20260605_180139',
  },
  {
    up: migration_20260608_155405_add_prefix_to_media.up,
    down: migration_20260608_155405_add_prefix_to_media.down,
    name: '20260608_155405_add_prefix_to_media',
  },
  {
    up: migration_20260615_144644_add_drafts_status.up,
    down: migration_20260615_144644_add_drafts_status.down,
    name: '20260615_144644_add_drafts_status',
  },
  {
    up: migration_20260615_145551_add_scheduled_publish_and_published_at.up,
    down: migration_20260615_145551_add_scheduled_publish_and_published_at.down,
    name: '20260615_145551_add_scheduled_publish_and_published_at'
  },
];
