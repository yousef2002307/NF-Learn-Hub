<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Helper\Functions\Functions;
class stures extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $sub = new Functions();
        $sub2 = $sub->monthPassed($this->subscribe_at);
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'child_id' => $this->child_id,
            'study year' => $this->studyyear,
            'is_subscribed' => !$sub2,
            'is_parent' => $this->is_parent,
        ];

    }
}
