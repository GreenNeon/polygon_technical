<template>
	<app-layout>
		<template #header>
			<h2 class="font-semibold text-xl text-gray-800">
				<portal-target name="header-name"> Dashboard </portal-target>
			</h2>
		</template>

		<div class="md:py-8">
			<div class="max-w-7xl py-1 mx-auto sm:px-6 lg:px-8">
				<div class="bg-white md:bg-gray-100 overflow-hidden">
					<slot></slot>
				</div>
			</div>
		</div>
	</app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout";

export default {
	components: {
		AppLayout,
	},
};
</script>
