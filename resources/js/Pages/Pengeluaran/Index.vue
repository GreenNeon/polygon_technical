<template>
	<div class="py-3">
		<portal to="header-name"> Dashboard Pengeluaran </portal>
		<div class="card-tool">
			<v-row align="center" justify-lg="center" class="px-4 md:px-0 mt-0.5">
				<v-col cols="12" sm="6" md="7">
					<h2 class="text-md font-semibold">
						<v-icon color="blue darken-2" class="mx-1">
							mdi-account-supervisor
						</v-icon>
						Data Pengeluaran
					</h2>
				</v-col>
				<v-col cols="12" sm="3" md="3">
					<v-text-field
						v-model="search"
						append-icon="mdi-magnify"
						label="Search"
						single-line
						hide-details
						outlined
						dense
						clearable
					></v-text-field>
				</v-col>
				<v-col cols="12" sm="2" md="1">
					<v-btn
						color="primary"
						elevation="2"
						:href="route('dashboard.pengeluaran.create')"
						>Buat Baru</v-btn
					>
				</v-col>
			</v-row>
		</div>
		<hr class="block md:hidden" />
		<div class="card-table">
			<v-data-table
				:headers="headers"
				:items="pengeluaran_all"
				:search="search"
				:items-per-page="5"
			>
				<template v-slot:item.actions="{ item }">
					<inertia-link :href="route('dashboard.pengeluaran.show', [item.id])">
						<v-icon small class="mr-2"> mdi-eye </v-icon>
					</inertia-link>

					<inertia-link :href="route('dashboard.pengeluaran.edit', [item.id])">
						<v-icon color="blue darker-3" small class="mr-2">
							mdi-pencil
						</v-icon>
					</inertia-link>
					<v-icon color="red" small @click="deleteItem(item)">
						mdi-delete
					</v-icon>
				</template>
			</v-data-table>

			<v-dialog v-model="dialogDelete" persistent max-width="290">
				<v-card>
					<v-card-title>
						<span class="font-sans text-lg font-semibold"
							>Hapus Data Pengeluaran?</span
						>
					</v-card-title>
					<v-card-text
						>Apakah anda yakin untuk <b>menghapus</b> data ini?, data tidak bisa
						dikembalikan kembali.</v-card-text
					>
					<v-card-actions>
						<v-spacer></v-spacer>
						<v-btn text @click="dialogDelete = false"> Batal </v-btn>
						<v-btn color="red darken-1" @click="deleteItemConfirm">
							<span class="text-white">Hapus</span>
						</v-btn>
					</v-card-actions>
				</v-card>
			</v-dialog>

			<v-snackbar
				:timeout="800"
				:value="snackbar.show"
				bottom
				center
				:color="snackbar.color"
				class="my-4"
				elevation="24"
			>
				{{ snackbar.message }}
			</v-snackbar>
		</div>
	</div>
</template>

<script>
import Layout from "../Dashboard.vue";
export default {
	name: "Pengeluaran-Admin-Index",
	setup() {},
	props: ["pengeluaran_all", "flash"],
	layout: (h, page) => h(Layout, [page]),
	// Using the shorthand
	layout: Layout,
	data() {
		return {
			snackbar: {
				show: false,
				color: "red accent-2",
				message: "",
			},
			editedItem: {},
			dialogDelete: false,
			search: "",
			headers: [
				{ text: "Nominal", value: "nominal.formatted" },
				{ text: "Tanggal", value: "tanggal", filterable: true },
				{ text: "Kategori", align: "start", value: "nama_kategori" },
				{ text: "Keterangan", value: "keterangan", filterable: false },
				{ text: "Status", value: "status", filterable: false },
				{
					text: "Actions",
					value: "actions",
					sortable: false,
					filterable: false,
				},
			],
		};
	},
	methods: {
		deleteItem(item) {
			this.editedItem = item;
			this.dialogDelete = true;
		},

		deleteItemConfirm() {
			this.dialogDelete = false;
			this.$inertia.delete(
				route("dashboard.pengeluaran.destroy", [this.editedItem.id]),
				{
					onSuccess: (page) => {
						this.snackbar.show = true;
						this.snackbar.message = "Berhasil menghapus data pengeluaran..";
						this.snackbar.color = "green darken-1 ";
						let id = this.pengeluaran_all.findIndex(
							(item) => item.id === this.editedItem.id
						);
						if (id > -1) this.pengeluaran_all.splice(id, 1);
						this.editedItem = {};
					},
					onError: (errors) => {
						this.snackbar.show = true;
						this.snackbar.message = "Gagal menghapus data pengeluaran..";
						this.snackbar.color = "red accent-2";
						this.editedItem = {};
					},
				}
			);
		},
	},
};
</script>

<style>
.card-tool {
	@apply mx-2 px-2 shadow-none bg-white rounded py-2;
}

.card-table {
	@apply mt-6 mx-2 shadow-none rounded px-4 bg-white;
}

@screen md {
	.card-tool {
		@apply shadow pb-0;
	}
	.card-table {
		@apply shadow px-0;
	}
}
</style>
