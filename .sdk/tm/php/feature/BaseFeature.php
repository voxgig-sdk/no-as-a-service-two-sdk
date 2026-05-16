<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK base feature

class NoAsAServiceTwoBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(NoAsAServiceTwoContext $ctx, array $options): void {}
    public function PostConstruct(NoAsAServiceTwoContext $ctx): void {}
    public function PostConstructEntity(NoAsAServiceTwoContext $ctx): void {}
    public function SetData(NoAsAServiceTwoContext $ctx): void {}
    public function GetData(NoAsAServiceTwoContext $ctx): void {}
    public function GetMatch(NoAsAServiceTwoContext $ctx): void {}
    public function SetMatch(NoAsAServiceTwoContext $ctx): void {}
    public function PrePoint(NoAsAServiceTwoContext $ctx): void {}
    public function PreSpec(NoAsAServiceTwoContext $ctx): void {}
    public function PreRequest(NoAsAServiceTwoContext $ctx): void {}
    public function PreResponse(NoAsAServiceTwoContext $ctx): void {}
    public function PreResult(NoAsAServiceTwoContext $ctx): void {}
    public function PreDone(NoAsAServiceTwoContext $ctx): void {}
    public function PreUnexpected(NoAsAServiceTwoContext $ctx): void {}
}
