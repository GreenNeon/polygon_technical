<template>
	<div id="Form-Main-Pengeluaran">
		<jet-form-section @submitted="sendForm">
			<template #title> Informasi Pengeluaran </template>

			<template #description>
				Isi untuk data pengeluaran utama yang akan disimpan.
				<br />
				<b>Wajib Diisi</b>
			</template>

			<template #form>
				<!-- Nominal -->
				<div class="col-span-6 sm:col-span-6">
					<jet-label for="nominal" value="Nominal" />
					<jet-input
						id="nominal"
						type="number"
						class="mt-1 block w-full"
						v-model="form.nominal"
						:disabled="readonly"
						autocomplete="nominal"
					/>
					<jet-input-error :message="form.errors.nominal" class="mt-2" />
				</div>
                <!-- Kategori -->
				<div class="col-span-6 sm:col-span-3">
					<jet-label for="kategori" value="Kategori" />
					<v-select
						v-model="form.kategori"
						:items="kategori"
						dense
						class="mt-1 block w-full text-sm"
						label="Pilih kategori"
						solo
						:disabled="readonly"
						hide-details
					></v-select>
					<jet-input-error :message="form.errors.kategori" class="mt-2" />
				</div>
                <!-- Tanggal -->
				<div class="col-span-6 sm:col-span-3">
					<jet-label for="tanggal" value="Tanggal" />
					<jet-input
						id="tanggal"
						type="date"
						class="mt-1 block w-full"
						v-model="form.tanggal"
						:disabled="readonly"
						autocomplete="tanggal"
					/>
					<jet-input-error :message="form.errors.tanggal" class="mt-2" />
				</div>
				<!-- Keterangan -->
				<div class="col-span-6 sm:col-span-12">
					<jet-label for="keterangan" value="Keterangan" />
					<textarea
                        rows="3"
						id="keterangan"
						type="text"
						class="form-input border-solid rounded-md shadow-sm mt-1 block w-full"
						v-model="form.keterangan"
						:disabled="readonly"
					></textarea>
					<small class="mx-1 text-gray-500">Keterangan pengeluaran.</small>
					<jet-input-error :message="form.errors.keterangan" class="mt-2" />
				</div>
			</template>
			<template #actions>
				<jet-action-message
					:on="form.recentlySuccessful"
					class="mr-3"
					:type="alert_data.type"
				>
					{{ alert_data.message }}
				</jet-action-message>

				<v-btn
					@click="sendForm"
					v-show="!readonly"
					color="primary"
					:loading="form.processing"
				>
					Simpan
				</v-btn>
			</template>
		</jet-form-section>
	</div>
</template>

<script>
import JetButton from "@/Jetstream/Button";
import JetFormSection from "@/Jetstream/FormSection";
import JetInput from "@/Jetstream/Input";
import JetInputError from "@/Jetstream/InputError";
import JetLabel from "@/Jetstream/Label";
import JetActionMessage from "@/Jetstream/ActionMessage";
import JetSecondaryButton from "@/Jetstream/SecondaryButton";

export default {
	name: "Pengeluaran-Form-Main",
	components: {
		JetActionMessage,
		JetButton,
		JetFormSection,
		JetInput,
		JetInputError,
		JetLabel,
		JetSecondaryButton,
	},

	props: {
		user: { default: {} },
		initial_data: {},
		alert_data: {},
		readonly: { default: false },
		create: { default: false },
	},
	data() {
		return {
			resetLoading: false,
			form: this.$inertia.form(
				{
					_method: "POST",
                    ...this.initial_data,
                    tanggal: this.initial_data.tanggal ?? moment().format('YYYY-MM-DD'),
                    kategori: this.initial_data.kategori ?? 0
				},
				{
					bag: "default",
					resetOnSuccess: false,
				}
			),
            kategori: [
                {value:5, text: "Listrik"},
                {value:6, text: "Makanan"},
                {value:7, text: "Anak"},
                {value:8, text: "Hobi"},
                {value:9, text: "Transportasi"},
                {value:99, text: "Lain-Lain"},
            ]
		};
	},

	computed: {},

	methods: {
		sendForm() {
			this.$emit("send-form", this.form);
		},
	},
};
</script>
