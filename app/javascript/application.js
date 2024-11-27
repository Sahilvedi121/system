// app/javascript/packs/application.js
import Rails from '@rails/ujs';
import { Turbo } from 'turbo-rails';
import 'channels';

Rails.start();
Turbo.start();
