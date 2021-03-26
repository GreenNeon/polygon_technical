<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CashForm extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nominal' => 'bail|required|numeric|gte:0',
            'tanggal' => 'required|date',
            'kategori' => 'bail|required|numeric|gte:0|lte:9',
            'keterangan' => 'nullable|string',
            'status' => 'nullable|in:BLM,SDH'
        ];
    }
}
