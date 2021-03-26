<template>
	<section id="Create-Pengeluaran">
		<portal to="header-name">
			<div class="flex justify-between">
				<div>Buat Pengeluaran</div>
				<div>
					<v-btn text class="mx-1" :href="route('dashboard.pengeluaran.index')"
						><v-icon class="mr-1">mdi-arrow-left </v-icon> Kembali
					</v-btn>
				</div>
			</div>
		</portal>
        <form-main @send-form="sendFormMain" :user="user" :initial_data="initial_data" :alert_data="flash.alert_data || {}" :create="true"></form-main>
	</section>
</template>

<script>
import Layout from "../Dashboard.vue";
import FormMain from "./FormMain.vue";

export default {
	name: "Pengeluaran-Admin-Create",
	components: {
		FormMain
	},

	props: { user: { default: {} }, initial_data: {}, flash: {} },
	layout: (h, page) => h(Layout, [page]),
	// Using the shorthand
	layout: Layout,
	data() {
		return {
		};
	},

	methods: {
		sendFormMain(form) {
			form.post(route("dashboard.pengeluaran.store"));
		}
	},
};
</script>
