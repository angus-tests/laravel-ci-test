<template>
    <Link v-if="isLink" :class="[sizeClass, baseClasses]">
        <slot/>
    </Link>
    <button v-bind="$attrs" v-else :class="[sizeClass, baseClasses]">
        <slot />
    </button>
</template>

<script>
export default {
    name: "PrimaryButton",
    props: {
        size: {
            default: "m",
        },
        isLink: {
            default: false,
        }
    },


    computed: {
        sizeClass() {
            switch (this.size){
                case "l":
                    return "px-3 py-2 md:py-3 md:px-5 text-md"
                case "s":
                    return "px-2 py-1 text-sm"
                default:
                    return "px-3 py-2 text-sm"
            }
        },

        baseClasses(){
            return "inline-flex items-center rounded-md bg-primary font-semibold text-white shadow-sm hover:bg-primary-dark";
        }

    }
}


</script>

