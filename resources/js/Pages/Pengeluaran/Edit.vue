<template>
	<section id="Create-Pengeluaran">
		<portal to="header-name">
			<div class="flex justify-between">
				<div>{{ readonly ? "Lihat" : "Edit" }} Pengeluaran</div>
				<div>
					<v-btn text class="mx-1" :href="route('dashboard.pengeluaran.index')"
						><v-icon class="mr-1">mdi-arrow-left </v-icon> Kembali
					</v-btn>
					<v-btn
						v-show="readonly"
						color="primary"
						class="mx-1"
						:href="route('dashboard.pengeluaran.edit', [initial_data.id])"
					>
						Edit
						<v-icon small class="ml-1">mdi-pencil </v-icon>
					</v-btn>
				</div>
			</div>
		</portal>

		<form-main
			@send-form="sendFormMain"
			:user="user"
			:initial_data="initial_data"
			:alert_data="flash.alert_data || {}"
			:readonly="readonly"
		></form-main>
	</section>
</template>

<script>
import Layout from "../Dashboard.vue";
import FormMain from "./FormMain.vue";

export default {
	name: "Pengeluaran-Admin-Edit",
	components: {
		FormMain,
	},

	props: { user: { default: {} }, initial_data: {}, readonly: {}, flash: {} },
	layout: (h, page) => h(Layout, [page]),
	// Using the shorthand
	layout: Layout,
	data() {
		return {};
	},

	methods: {
		sendFormMain(form) {
			form.patch(route("dashboard.pengeluaran.update", [form.id]), {
				preserveScroll: true,
			});
		},
	},
};
</script>
