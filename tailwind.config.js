import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './vendor/laravel/jetstream/**/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.vue',
    ],

    darkMode: 'class',

    theme: {
        extend: {
            fontFamily: {
                sans: ['Outfit', ...defaultTheme.fontFamily.sans],
            },

            colors: {
                primary: {
                    light2: "#BBF48A",
                    light: "#91DC52",
                    DEFAULT: "#62b31e",
                    dark: "#559B1B",
                    dark2: "#4D861E",
                },

                accent: {
                    light2: "#7DBFF0",
                    light: "#509ED8",
                    DEFAULT: "#3087C7",
                    dark: "#347CB1",
                    dark2: "#2C6A98",
                },

                dark: {
                    light2: "#4A6682",
                    light: "#344D66",
                    DEFAULT: "#24384C",
                    dark: "#253442",
                    dark2: "#24313D",
                },

                light: {
                    light2: "#FFFFFF",
                    light: "#FAFAFA",
                    DEFAULT: "#F3F3F3",
                    dark: "#DEDEDE",
                    dark2: "#D0D0D0",
                },

                bgc:{
                    DEFAULT: "#F3F4F6",
                    dark:  "#17202A",
                },

                txt: {
                    DEFAULT: "#94A2B8",
                    dark:  "#334255",
                }
            },
        },
    },

    plugins: [forms, typography],
};
